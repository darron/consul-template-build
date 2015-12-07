class ConsulTemplate < FPM::Cookery::Recipe
  name 'consul-template'

  version '0.11.1'
  revision '1'
  description 'Generic template rendering and notifications with Consul.'

  homepage 'https://github.com/hashicorp/consul-template'
  source "https://releases.hashicorp.com/consul-template/#{version}/consul-template_#{version}_linux_amd64.zip"
  sha256 'aa681229e77f93c569eca2883f674184d05d1bdc0ca33234e28c2b60f17dc398'

  maintainer 'Darron Froese <darron@froese.org>'
  vendor 'octohost'

  license 'Mozilla Public License, version 2.0'

  depends 'unzip'
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
