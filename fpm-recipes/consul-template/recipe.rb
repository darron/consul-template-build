class ConsulTemplate < FPM::Cookery::Recipe
  name 'consul-template'

  version '0.7.0'
  revision '1'
  description 'Generic template rendering and notifications with Consul.'

  homepage 'https://github.com/hashicorp/consul-template'
  source "https://github.com/hashicorp/consul-template/releases/download/v#{version}/consul-template_#{version}_linux_amd64.tar.gz"
  sha256 '7b8fb97caef72f9e67bbb9069042b8e01f7efed3acd2a32f560a8fe60146d874'

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
