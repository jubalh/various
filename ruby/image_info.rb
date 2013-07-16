#https://github.com/envatoexiv2
require 'exiv2'

image = Exiv2::ImageFactory.open("image.jpg")
image.read_metadata
puts "iptc"
image.iptc_data.each do |key, value|
	  puts "#{key} = #{value}\n"
end
puts "exif"
#image.exif_data.each do |key, value|
#	  puts "#{key} = #{value}\n"
#end
puts "xmp"
image.xmp_data.each do |key, value|
	  puts "#{key} = #{value}\n"
end

date = image.exif_data["Exif.Image.DateTime"]
puts "whole: "+date
a = date.split(":",3)
puts a[0]
puts a[1]
b = a[2].split(" ")
puts "b:"+b[0]
