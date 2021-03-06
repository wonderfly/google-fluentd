name "jemalloc"
default_version "4.2.1"

# for td-agent
version("2.2.5") do
  md5 = 'a5c4332705ed0e3fff1ac73cfe975640'
  source :md5 => md5,
         :url => "http://pkgs.fedoraproject.org/repo/pkgs/jemalloc/jemalloc-#{version}.tar.bz2/#{md5}/jemalloc-#{version}.tar.bz2"
end
version("3.6.0") do
  md5 = 'e76665b63a8fddf4c9f26d2fa67afdf2'
  source :md5 => md5,
         :url => "http://pkgs.fedoraproject.org/repo/pkgs/jemalloc/jemalloc-#{version}.tar.bz2/#{md5}/jemalloc-#{version}.tar.bz2"
end
version("4.2.1") do
  md5 = '094b0a7b8c77c464d0dc8f0643fd3901'
  source :md5 => md5,
         :url => "http://pkgs.fedoraproject.org/repo/pkgs/jemalloc/jemalloc-#{version}.tar.bz2/#{md5}/jemalloc-#{version}.tar.bz2"
end

# On Mac, this file blocks package building at health check so add to whitelist
whitelist_file "libjemalloc\.1\.dylib"

relative_path "jemalloc-#{version}"

env = with_standard_compiler_flags(with_embedded_path)

build do
  command ["./configure", '--disable-debug',
           "--prefix=#{install_dir}/embedded"].join(" "), :env => env
  make "-j #{workers}", :env => env
  make "install", :env => env
end
