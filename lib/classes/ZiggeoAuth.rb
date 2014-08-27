require 'openssl'
require 'digest/md5'
require 'securerandom'
require 'json'

class ZiggeoAuth

  def initialize(application)
    @application = application
    @cipher = nil
  end
  
  def _encrypt(plaintext)
    if (@cipher == nil)
      hashed_key = Digest::MD5.hexdigest(@application.encryption_key)
      @cipher = OpenSSL::Cipher::Cipher.new("AES-256-CBC")
      @cipher.encrypt
      @cipher.padding = 1
      @cipher.key = hashed_key
    end
    iv = SecureRandom.hex(8)
    @cipher.iv = iv
    encrypted = @cipher.update(plaintext) + @cipher.final
    encrypted = encrypted.unpack("H*").first
    return iv + encrypted
  end
  
  def generate(options = {})
    data = {
      "application_token" => @application.token,
      "nonce" => self._generateNonce()
    }    
    data.update(options)
    return self._encrypt(JSON.generate(data))
  end
  
  def _generateNonce()
    t = Time.new
    return t.to_i.to_s + rand(256 * 256 * 256 * 256).to_s
  end

end
