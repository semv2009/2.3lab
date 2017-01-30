if __FILE__ == $0
  file = File.read("access.log")
  puts file

  ips = file.scan(/\d+\.\d+\.\d+\.\d+/)
  gropedIp = Hash.new
  ips.each do |ip|
    parts = ip.split(".")
    parts.delete_at(3)
    common = parts.join(".")
    if !gropedIp.key?(common) 
      puts "not"
      gropedIp[common] = Array.new 
      gropedIp[common].push(ip)
    else
      if !gropedIp[common].include?(ip)
        gropedIp[common].push(ip)
      end
    end
  end

  gropedIp.each do |key, array|
    puts "Common #{key}"
    gropedIp[key].each do |ip|
      puts "  #{ip}"
    end
  end
end