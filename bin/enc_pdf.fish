#!/bin/fish

#set -g filename
#set -g phonenumber
set -g pwd
set -g verbose false

function help
   
    printf "Encode-pdf script\n\n"
    printf "Script that will generate a password, and encrypt a pdf.\n"
    printf "When encryption is done a QR code will be generated and displayed.\n"
    printf "This QR code will generate an sms containing the credentials to the pdf.\n\n"
    printf "Example:\n"
    printf "  enc_pdf <file_path> <phonenumber>\n\n"
    printf "Options:\n"
    printf "  --h/--help       Prints help and exits\n"
    printf "  --v/--verbose    Prints verbose output\n"
    printf "\n"

end

function gen_credentials
    
    echo (dd if=/dev/urandom bs=16 count=1 2>/dev/null | base64 | sed 's/=//g')

end

function encrypt_pdf

    set filename $argv[1]
    set credentials $argv[2]

    if $verbose
        printf "DEBUG: Encrypting pdf $filename\n"
    end

    set fname (echo $filename | sed 's/\.[^.]*$//')
    qpdf -encrypt $credentials $credentials 256 -- $filename $fname.enc.pdf

    if $verbose
        printf "DEBUG: Encryption completed:\n" 
        printf "  output: $fname.enc.pdf\n"
    end
end

function generate_qr_code

    set phonenumber $argv[1]
    set credentials $argv[2]

    if $verbose
        printf "DEBUG: Generating QR-code\n"
        printf "DEBUG: QR-code options:\n"
        printf "  phonenumber: $phonenumber\n"
        printf "  credentials: $credentials\n"
    end

    qrencode -l H -t ANSIUTF8 "smsto:$phonenumber:credentials: $credentials"

    if $verbose
        printf "DEBUG: QR-code generated.\n"
    end
end

function main

    set filename $argv[1]
    set phonenumber $argv[2]

    if $verbose
        printf "DEBUG: Provided input options: \n"
        printf "  filename: $filename\n"
        printf "  phonenumber: $phonenumber\n"
    end

    if not test -f $filename
        set_color red
        printf "ERROR: file could not be found\n\n"
        set_color normal
        help
        exit 1
    end

    set credentials (gen_credentials)
    encrypt_pdf $filename $credentials
    generate_qr_code $phonenumber $credentials

    if $verbose
        printf "DEBUG: Script done exiting\n\n"
    end
end

argparse 'h/help' 'v/verbose' -- $argv

if set --query _flag_help
    echo "help"
    help
    exit 0
end

if set --query _flag_verbose
    echo "verbose"
    set verbose true
end

main $argv[1] $argv[2]
exit 0

