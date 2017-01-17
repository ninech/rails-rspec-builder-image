# Rails-RSpec-Builder Image

This image is a base image for RSpec runs in Ruby (on Rails) applications. It is intendet to be used as base image for [Openshift Customer Build](https://docs.openshift.com/enterprise/3.2/creating_images/custom.html#custom-builder-image) processes.

To following command builds a successfull run:

    docker run --rm rails-rspec-builder-image

And the following commands build a failing run:

    docker run --rm -e FAIL=1 rails-rspec-builder-image
