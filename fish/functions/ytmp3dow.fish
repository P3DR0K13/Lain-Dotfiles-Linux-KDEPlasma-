function ytmp3dow --description 'Baixa músicas do YouTube em MP3 com metadados completos e limpos'
    if test -z "$argv[1]"
        echo "Uso: ytmp3dow <URL_DO_YOUTUBE>"
        return 1
    end
    
    yt-dlp \
                -x \
                --audio-format mp3 \
                --audio-quality 0 \
                --embed-thumbnail \
                --embed-metadata \
                --parse-metadata "description:%(meta_comment)s" \
                --parse-metadata "view_count:%(meta_lyrics)s" \
                --parse-metadata "upload_date:%(meta_date)s" \
                --parse-metadata "upload_date:%(meta_year)s" \
                --parse-metadata "uploader:%(meta_album)s" \
                --parse-metadata "%(title)s:%(title)s" \
                --replace-in-metadata "title" "^[^•|-]+ \s*[•|-]\s*" "" \
                --convert-thumbnails jpg \
                --ppa "ffmpeg: -c:v mjpeg -vf \"crop=ih:ih\"" \
                -o "/home/p3drok13/Músicas/%(uploader)s - %(title)s.%(ext)s" \
                $argv[1]
end
