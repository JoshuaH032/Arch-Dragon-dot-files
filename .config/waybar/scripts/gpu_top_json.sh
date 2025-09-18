#!/usr/bin/env bash
set -euo pipefail

# Poll intel_gpu_top in JSON mode and map it to Waybar JSON.
# Works on Gen12+ (Iris Xe) and is resilient to key name shifts across versions.

intel_gpu_top -J -s 1000 2>/dev/null | jq -r '
  # Grab the first Render/3D engine busy %
  ( .engines // {} | to_entries
    | map(select(.key|test("^Render/3D")))
    | (.[0].value.busy // 0)
  ) as $busy
  |
  # Try multiple possible locations for actual frequency (MHz)
  ( .freq.act // .frequency.actual // 0 ) as $mhz
  |
  # RC6 residency (% of time in deep sleep)
  ( .rc6.value // 0 ) as $rc6
  |
  # Build Waybar payload
  {
    "text": ("GPU " + ($busy|tonumber|round|tostring) + "%"),
    "tooltip": ("Render: " + ($busy|tostring) + "%\nClock: " + ($mhz|tostring) + " MHz\nRC6: " + ($rc6|tostring) + "%"),
    "class": (
      if ($busy|tonumber) > 80 then "gpu-high"
      elif ($busy|tonumber) > 40 then "gpu-med"
      else "gpu-low" end
    )
  }'
