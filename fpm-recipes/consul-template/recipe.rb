class ConsulTemplate < FPM::Cookery::Recipe
  name 'consul-template'

  version '0.12.2'
  revision '1'
  description 'Generic template rendering and notifications with Consul.'

  homepage 'https://github.com/hashicorp/consul-template'
  source "https://releases.hashicorp.com/consul-template/#{version}/consul-template_#{version}_linux_amd64.zip"
  sha256 'a8780f365bf5bfad47272e4682636084a7475ce74b336cdca87c48a06dd8a193'

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
