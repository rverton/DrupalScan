require 'open-uri'

class DrupalScan
	def self.getVersion(url)
		begin
			if url.match /\/$/
				res = open("#{url}CHANGELOG.txt")
			else
				res = open("#{url}/CHANGELOG.txt")
			end
			res.readline
		rescue OpenURI::HTTPError
			"Not found"
		end
	end

	def self.enumerateModules(url, lookup_modules = true)
			modules = {}

			begin
				res = open(url)
			rescue OpenURI::HTTPError
				return {}
			end

			if res.status[0] == "200"

				for match in res.read.scan /modules\/(.*?)\//
					modules[match[0]] = true

					if lookup_modules
						require 'nokogiri'

						lookup_res = open("http://drupal.org/project/#{match[0]}")
						if lookup_res.status[0] == "200"

							doc = Nokogiri::HTML lookup_res.read
							description = doc.css('.node-content p')
							if description.length > 0
								modules[match[0]] = description[0].content
								modules[match[0]] += "http://drupal.org/project/#{match[0]}"
							else
								modules[match[0]] = "Could not extract description from drupal.org"
							end

						else
							modules[match[0]] = "Not found on drupal.org"
						end
						
					end

				end
				modules
			else
				puts "URL not accessible (HTTP Status: #{res.status[0]})"
				exit
			end
		end
end
