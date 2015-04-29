class ConsulTemplate < FPM::Cookery::Recipe
  name 'consul-template'

  version '0.9.0'
  revision '1'
  description 'Generic template rendering and notifications with Consul.'

  homepage 'https://github.com/hashicorp/consul-template'
  source "https://github.com/hashicorp/consul-template/releases/download/v#{version}/consul-template_#{version}_linux_amd64.tar.gz"
  sha256 '3d8c9fcaee18a4369cc731528ce9d6a5be03d88b954a2fea0f4406fc54c70fc8'

  maintainer 'Darron Froese <darron@froese.org>'
  vendor 'octohost'

  license 'Mozilla Public License, version 2.0'

  depends 'consul'
  provides 'consul-template'

  pre_install 'preinst'

  def build
    safesystem "mkdir -p #{builddir}/usr/local/bin/"
    safesystem "cp -f #{builddir}/consul-template_#{version}_linux_amd64/consul-template #{builddir}/usr/local/bin/"
  end

  def install
    safesystem "mkdir -p #{destdir}/usr/local/bin/"
    safesystem "cp -f #{builddir}/usr/local/bin/consul-template #{destdir}/usr/local/bin/consul-template"
  end
end
