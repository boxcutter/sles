## Standalone Usage

This Compliance Profile requires [InSpec](https://downloads.chef.io/inspec) for execution

```
$ git clone https://github.com/boxcutter/sles
$ cd sles
$ inspec exec test/sles \
    -t ssh://<ip> --user=vagrant --password=vagrant --sudo
```
