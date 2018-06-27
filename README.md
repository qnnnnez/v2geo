v2geo
==========

# Dependencies
* bash
* wget
* python3
* protoc
* python library: protobuf

On Debian or Ubuntu, you can simply `apt install wget python3 protoc python3-protobuf` to get everything done.

# Steps

## `pre.sh`

Use this script to generate protobuf python module code from V2Ray source code.

You need to run it once before running v2geo.py.

## `v2geo.py`

This is the cli tool that actually do the job of generating .dat files.

Usages in detail can be read via `python3 v2geo.py --help`

## `generate.sh`

A simple script that automaticly generate geoip.dat and geosite.dat for you.

Generated files can be found in `output\`.
