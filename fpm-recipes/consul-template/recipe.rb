class ConsulTemplate < FPM::Cookery::Recipe
  name 'consul-template'

  version '0.15.0'
  revision '1'
  description 'Generic template rendering and notifications with Consul.'

  homepage 'https://github.com/hashicorp/consul-template'
  source "https://releases.hashicorp.com/consul-template/#{version}/consul-template_#{version}_linux_amd64.zip"
  sha256 'b7561158d2074c3c68ff62ae6fc1eafe8db250894043382fb31f0c78150c513a'

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
