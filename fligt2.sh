#!/bin/bash

# Daftar host yang ingin Anda cek
hosts=(
    'http://104.18.49.163/'
    'http://cvs-deo.shopeemobile.com/'
    'http://play.spotify.com/'
	'104.18.53.172'
)

while true; do
    success_count=0

    for host in "${hosts[@]}"; do
        if curl "$host" --connect-timeout 5 >/dev/null 2>&1; then
            ((success_count++))
        else
            echo "[$host] Gagal terhubung"
        fi
    done

    if [ $success_count -eq 0 ]; then
        sudo cmd connectivity airplane-mode enable
        sudo cmd connectivity airplane-mode disable
        echo "[Sistem] Mengaktifkan mode pesawat"
        sleep 6
    fi
done
