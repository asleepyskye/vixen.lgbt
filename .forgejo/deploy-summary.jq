def mib: (. / 1048576 * 10 | round) / 10 | tostring + " MiB";
"### bunny deploy: `\(.site)`",
"",
(if .unchanged then "nothing changed"
 else "deployed **\(.files)** file\(if .files == 1 then "" else "s" end) (\(.bytes | mib))." end),
"",
"| | |",
"|---|---|",
"| site | `\(.site)` |",
"| deploy id | `\(.id)` |",
(if .unchanged then empty else
  "| source | `\(.source)` |",
  "| files | \(.files) |",
  "| size | \(.bytes | mib) |"
 end),
"| live | \(if .live then "yes" else "**no**" end) |",
"| commit | `\($sha[:12])` |",
"| url | \(.production) |"
