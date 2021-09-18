# patterntail

See
[https://yosj.com.au/staff/shell_scripts/patterntail](https://yosj.com.au/staff/shell_scripts/patterntail)
for details.

patterntail searches a (log) file for the occurrance(s) of a particular pattern, and then output the rest of the file from that point (the 'tail').
It is assumed the pattern will contain timestamp information.

patterntail is intended to be used to search through system administration logs (e.g., Oracle alert logs, Linux system logs, etc.
It always searches relevant to "now", when it's started.
