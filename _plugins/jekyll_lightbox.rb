# Borrows from https://github.com/matthewowen/jekyll-slideshow
# Which is Copyright (c) 2013 Matthew Owen
# and MIT licensed
# Copyright (c) 2015 Rob Myers
# MIT license.

require 'rmagick'
require 'nokogiri'
include Magick

module Jekyll

  module LightboxGallery

    # if we don't have values set for thumbnails, use a sensible default
    if Jekyll.configuration({}).has_key?('lightbox')
      @@config = Jekyll.configuration({})['lightbox']
    else
      @@config = Hash["width", 150, "height", 150]
    end

    @@site = Jekyll.sites[0]

    def shouldThumb?(filepath, newpath)
      (! File.file?(newpath)) ||
        File.mtime(newpath).to_i < File.mtime(filepath).to_i
    end

    def filePath(url)
      File.join(@@site.source, url)
    end

    def thumbPath(filepath)
      File.dirname(filepath) +
        '/' + File.basename(filepath, '.*') +
        '__thumb' + File.extname(filepath)
    end

    def makeThumb(filepath, thumbnailpath)
      img = Magick::Image::read(filepath).first
      thumb = img.resize_to_fill(@@config['width'], @@config['height'])
      thumb.write thumbnailpath
    end

    def ensureThumb(url)
      filepath = filePath url
      thumbpath = thumbPath filepath
      if shouldThumb?(filepath, thumbpath)
        makeThumb(filepath, thumbpath)
        @@site.static_files <<
          StaticFile.new(@@site, @@site.source,
                         File.dirname(thumbpath).sub(@@site.source, ''),
                         File.basename(thumbpath))
      end
    end

    def galleries(content)
      doc = Nokogiri::HTML.fragment(content)
      imagenum = 1
      #FIXME: What if there are multiple galleries per page?
      #       It's OK for the front page, we filter each post separately.
      doc.css('ul li img').each do |img|
        url = img['src']
        ensureThumb url
        newurl = File.dirname(url) << '/' <<
                 File.basename(url, File.extname(url)) <<
                 '__thumb' << File.extname(url)
        # Repeatedly sets the value, this is better than tagging each li
        img.parent['class'] = 'lightbox-li'
        img.replace '<a class="lightbox-image-link" href="' << url <<
                    '" data-lightbox="lightbox-' << imagenum << '">' <<
                    '<img class="lightbox-image" src="' <<
                    newurl << '" alt="' << '' << '"></a>'
        imagenum += 1
      end
      return doc.to_s
    end

  end

end

Liquid::Template.register_filter(Jekyll::LightboxGallery)
