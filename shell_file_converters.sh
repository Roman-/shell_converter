#!/bin/bash
# Generated by shell_converters_generator.py: https://github.com/Roman-/shell-file-converters

# Function to display Usage
_sfc_usage() {
    echo "Usage: $1 <input_filename> [output_filename]"
}

# Check for command availability
_sfc_check_command() {
    if ! command -v $1 &> /dev/null; then
        echo "$1 could not be found, please install the necessary package(s) first."
        return 1
    fi
}

# Confirm overwriting existing file, if any
_sfc_confirm() {
    if [ -f "$1" ]; then
        while true; do
            echo -n "File $1 exists. Do you want to overwrite it? (y/n) "
            read -r answer
            case $answer in
                [Yy]* ) break;; # proceeding
                [Nn]* ) echo "Operation aborted."; return 1;;
                * ) echo "Please answer yes (y) or no (n).";;
            esac
        done
    fi
}

png2ico() {
    [ $# -ge 1 ] || { _sfc_usage "png2ico"; return 1; }
    _sfc_check_command convert || return 1
    local output=${2:-${1%.png}.ico}
    _sfc_confirm "$output" || return 1
    convert "$1" -resize 256x256 "$output"
}

png2jpg() {
    [ $# -ge 1 ] || { _sfc_usage "png2jpg"; return 1; }
    _sfc_check_command convert || return 1
    local output=${2:-${1%.png}.jpg}
    _sfc_confirm "$output" || return 1
    convert "$1" "$output"
}

jpg2png() {
    [ $# -ge 1 ] || { _sfc_usage "jpg2png"; return 1; }
    _sfc_check_command convert || return 1
    local output=${2:-${1%.jpg}.png}
    _sfc_confirm "$output" || return 1
    convert "$1" "$output"
}

webp2png() {
    [ $# -ge 1 ] || { _sfc_usage "webp2png"; return 1; }
    _sfc_check_command dwebp || return 1
    local output=${2:-${1%.webp}.png}
    _sfc_confirm "$output" || return 1
    dwebp "$1" -o "$output"
}

pdf2png() {
    [ $# -ge 1 ] || { _sfc_usage "pdf2png"; return 1; }
    _sfc_check_command pdftoppm || return 1
    local output=${2:-${1%.pdf}.png}
    _sfc_confirm "$output" || return 1
    pdftoppm -png "$1" "$output"
}

pdf2jpg() {
    [ $# -ge 1 ] || { _sfc_usage "pdf2jpg"; return 1; }
    _sfc_check_command convert || return 1
    local output=${2:-${1%.pdf}.jpg}
    _sfc_confirm "$output" || return 1
    convert -density 300 "$1" -quality 100 "$output"
}

pdf2word() {
    [ $# -ge 1 ] || { _sfc_usage "pdf2word"; return 1; }
    _sfc_check_command pdftotext || return 1
    local output=${2:-${1%.pdf}.word}
    _sfc_confirm "$output" || return 1
    pdftotext "$1" "$output"
}

md2pdf() {
    [ $# -ge 1 ] || { _sfc_usage "md2pdf"; return 1; }
    _sfc_check_command pandoc || return 1
    local output=${2:-${1%.md}.pdf}
    _sfc_confirm "$output" || return 1
    pandoc "$1" -o "$output"
}

md2html() {
    [ $# -ge 1 ] || { _sfc_usage "md2html"; return 1; }
    _sfc_check_command pandoc || return 1
    local output=${2:-${1%.md}.html}
    _sfc_confirm "$output" || return 1
    pandoc "$1" -o "$output"
}

docx2pdf() {
    [ $# -ge 1 ] || { _sfc_usage "docx2pdf"; return 1; }
    _sfc_check_command pandoc || return 1
    local output=${2:-${1%.docx}.pdf}
    _sfc_confirm "$output" || return 1
    pandoc -s "$1" -o "$output"
}

txt2pdf() {
    [ $# -ge 1 ] || { _sfc_usage "txt2pdf"; return 1; }
    _sfc_check_command enscript || return 1
    local output=${2:-${1%.txt}.pdf}
    _sfc_confirm "$output" || return 1
    enscript -p - "$1" | ps2pdf - "$output"
}

html2pdf() {
    [ $# -ge 1 ] || { _sfc_usage "html2pdf"; return 1; }
    _sfc_check_command wkhtmltopdf || return 1
    local output=${2:-${1%.html}.pdf}
    _sfc_confirm "$output" || return 1
    wkhtmltopdf "$1" "$output"
}

mp42mp3() {
    [ $# -ge 1 ] || { _sfc_usage "mp42mp3"; return 1; }
    _sfc_check_command ffmpeg || return 1
    local output=${2:-${1%.mp4}.mp3}
    _sfc_confirm "$output" || return 1
    ffmpeg -i "$1" -q:a 0 -map a "$output"
}

gif2mp4() {
    [ $# -ge 1 ] || { _sfc_usage "gif2mp4"; return 1; }
    _sfc_check_command ffmpeg || return 1
    local output=${2:-${1%.gif}.mp4}
    _sfc_confirm "$output" || return 1
    ffmpeg -f gif -i "$1" "$output"
}

mp42gif() {
    [ $# -ge 1 ] || { _sfc_usage "mp42gif"; return 1; }
    _sfc_check_command ffmpeg || return 1
    local output=${2:-${1%.mp4}.gif}
    _sfc_confirm "$output" || return 1
    ffmpeg -i "$1" "$output.gif"
}

flac2mp3() {
    [ $# -ge 1 ] || { _sfc_usage "flac2mp3"; return 1; }
    _sfc_check_command ffmpeg || return 1
    local output=${2:-${1%.flac}.mp3}
    _sfc_confirm "$output" || return 1
    ffmpeg -i "$1" -ab 320k "$output"
}

flac2wav() {
    [ $# -ge 1 ] || { _sfc_usage "flac2wav"; return 1; }
    _sfc_check_command ffmpeg || return 1
    local output=${2:-${1%.flac}.wav}
    _sfc_confirm "$output" || return 1
    ffmpeg -i "$1" "$output"
}

mp32wav() {
    [ $# -ge 1 ] || { _sfc_usage "mp32wav"; return 1; }
    _sfc_check_command ffmpeg || return 1
    local output=${2:-${1%.mp3}.wav}
    _sfc_confirm "$output" || return 1
    ffmpeg -i "$1" "$output"
}

wav2mp3() {
    [ $# -ge 1 ] || { _sfc_usage "wav2mp3"; return 1; }
    _sfc_check_command ffmpeg || return 1
    local output=${2:-${1%.wav}.mp3}
    _sfc_confirm "$output" || return 1
    ffmpeg -i "$1" -ab 192k "$output"
}
