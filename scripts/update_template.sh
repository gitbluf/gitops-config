#!/usr/bin/env bash

team=$1
template_path=flux/base
team_path=flux/apps/$team/base

cp -a -i $template_path/ $team_path/
