#!/bin/bash

# The following is a sample of how you might choose to create the flags.
# With this automated approach it only seems to work for go build and not go install :(


package="github.com/Financial-Times/service-status-go/buildinfo."
version="version=$(git describe --tag 2> /dev/null)"
dateTime="dateTime=$(date -u +%Y%m%d%H%M%S)"
repository="repository=$(git config --get remote.origin.url)"
revision="revision=$(git rev-parse HEAD)"
builder="builder=$(go version)"


for flag in "$version" "$datestamp" "$repository" "$revision" "$builder"
do
  set -- $flag
  ldflag="-X '"${package}${flag}"'"
  flags+="$ldflag "
done

echo $flags