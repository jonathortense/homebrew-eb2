class Eb2 < Formula
  include Language::Python::Virtualenv

  desc "Elastic Beanstalk ssh using the internal IP"
  homepage "https://github.com/jonathortense/homebrew-eb2"
  url "https://files.pythonhosted.org/packages/4a/19/034a6175115d493a544e3032ed1fcccfaa04c61a627cd436b888498c5bb0/eb2-0.0.1.tar.gz"
  sha256 "7426f6896ae318889b8bd786801838cf25b2a9b863b06ea8e9e137cbd13803f1"

  bottle do
    cellar :any_skip_relocation
#    sha256 "83badc49015db13b12f12ec1f3640716fba2161a80e91772d8ccdc144ff69185" => :mojave
#    sha256 "e88ba1b0777ae69d037fb3fe933b833ed8147d34b85aa0adb97b2d63df08a87f" => :high_sierra
  end

  resource "awsebcli" do
    url "https://files.pythonhosted.org/packages/cd/52/74d6fb2c789f061c5abfd0084b9f0592b3d7f39ae73c24b8a885a07d09d4/awsebcli-3.14.6.tar.gz"
    sha256 "b2dff9efbd83979b8050a95803eb88b0902660d926eae31e3a0bfe0836c2d318"
  end

  resource "setuptools" do
    url "https://files.pythonhosted.org/packages/b0/d1/8acb42f391cba52e35b131e442e80deffbb8d0676b93261d761b1f0ef8fb/setuptools-40.6.2.zip"
    sha256 "86bb4d8e1b0fabad1f4642b64c335b673e53e7a381de03c9a89fe678152c4c64"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    system "#{bin}/eb2", "--version"
  end
end


