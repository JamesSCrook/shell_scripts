# multx

See
[https://yosj.com.au/staff/shell_scripts/multx](https://yosj.com.au/staff/shell_scripts/multx)
for details.

But, very briefly, multx is a \*nix shell script that executes the same command(s) on multiple
\*nix hosts - either sequentially (synchronously) or in parallel (asynchronously).

multx is particularly useful for executing commands on multiple \*nix hosts when you don't have
access to a working configuration management tool that you know how to use.

There are two other support shell scripts (start-ssh-agent and stop-ssh-agent) - whose purpose is hopefully obvious -
so multx can be used without typing passphrases (or passwords).
