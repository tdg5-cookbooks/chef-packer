default[:packer][:url_base] = "https://releases.hashicorp.com/packer"
default[:packer][:version] = "1.2.5"
default[:packer][:arch] = node['kernel']['machine'] =~ /x86_64/ ? "amd64" : "386"

# Transform raw output of the bintray checksum list into a Hash[filename, checksum].
# https://dl.bintray.com/mitchellh/packer/${VERSION}_SHA256SUMS?direct
default[:packer][:raw_checksums] = <<-EOF
23c0f6f0e5d74bb4b7ba52e9239f744a8a11c8c36d5a4faf068d9dc60dce021b  packer_1.2.5_darwin_386.zip
3d546eff8179fc0de94ad736718fdaebdfc506536203eade732d9d218fbb347c  packer_1.2.5_darwin_amd64.zip
524503aff4ae5ca5d060c46c0919715db26a04e5fc9c20ce96adfd0f233ff05f  packer_1.2.5_freebsd_386.zip
989f04ec435d6a5105b5c5a52d7a23de054dcb96d875a0eee2c006c8847a52ce  packer_1.2.5_freebsd_amd64.zip
b086545729a463088e6004aa5f974816fc9895145cde815d19486e9f57bca8d6  packer_1.2.5_freebsd_arm.zip
586ff601017c29259dc3ebbf8b59afdc61391c54aa4b19208265902680a659b4  packer_1.2.5_linux_386.zip
bc58aa3f3db380b76776e35f69662b49f3cf15cf80420fc81a15ce971430824c  packer_1.2.5_linux_amd64.zip
c5b305707042d441e4d8a291c2c38cfc35d4333c53a7311e27ab424a310b205f  packer_1.2.5_linux_arm.zip
19d253a1bb9f981b45b530450ddc34324d23bdbfe62d645cb519bace9174bfce  packer_1.2.5_openbsd_386.zip
adfd6e3bcc19320f905e57e11b797102f52830c215983cf5ab9bb1368f8d0dee  packer_1.2.5_openbsd_amd64.zip
a46e6ef42b0d5f7d30a8865be6bd26af3f7baeec70c4f48108c21e09e856222e  packer_1.2.5_windows_386.zip
537118113207f14f54352165ef664f53aa674a3b1e69ef653f917bab42f2c688  packer_1.2.5_windows_amd64.zip
EOF

default[:packer][:checksums] = Hash[
  node[:packer][:raw_checksums].split("\n").collect { |s| s.split.reverse }
]
filename = "packer_#{node[:packer][:version]}_#{node[:os]}_#{node[:packer][:arch]}.zip"
default[:packer][:checksum] = node[:packer][:checksums][filename]
