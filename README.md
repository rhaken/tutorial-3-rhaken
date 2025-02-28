## Crouch
Gerakan crouch saya tambahkan dengan memeriksa apakah tombol ui_down ditekan saat karakter berada di lantai. Jika ditekan bersamaan dengan ui_left atau ui_right, maka karakter bisa bergerak dengan kecepatan lebih rendah (crouch_speed). Saya juga mengganti animasi menjadi "Crouching" agar sesuai dengan aksi karakter.
Implementasi Jump dengan Multi-Lompatan

## jump
Saya menggunakan variabel jump_count untuk membatasi jumlah lompatan hingga dua kali (double jump). Jika karakter sedang di tanah, jump_count di-reset ke nol. Setiap kali pemain menekan ui_up, jump_count meningkat hingga batas maksimum. Saya juga memastikan animasi "Jump" dimainkan hanya saat karakter benar-benar melompat.
Mekanisme Dash (Lari Cepat dalam Waktu Singkat)

## Dash
Dash diimplementasikan dengan mendeteksi "double tap" (dua kali tekan cepat) pada tombol gerakan (ui_left atau ui_right). Jika pemain menekan tombol yang sama dalam waktu singkat (double_tap_time), karakter akan masuk ke mode dash selama dash_duration. Saat dash aktif, kecepatan meningkat drastis (dash_speed), dan animasi "Dash" dimainkan.
Penyesuaian Animasi Sesuai Keadaan Karakter

## Animasi
Saya memastikan bahwa setiap aksi memiliki animasi yang sesuai. Contohnya, saat karakter dalam keadaan diam di tanah, animasi "Idle" dimainkan. Saat berjalan, "Run" dimainkan, dan saat melompat, "Jump" dimainkan. Hal ini dilakukan dengan menambahkan pengecekan apakah karakter sedang di tanah atau sedang melompat (is_jumping).
Hambatan dan Solusi yang Ditemukan

## Masalah saat mengerjakan
Masalah: Awalnya, animasi berjalan masih dimainkan meskipun karakter sedang dalam mode crouch atau dash.
Solusi: Saya menambahkan kondisi pengecekan di if is_dashing dan if Input.is_action_pressed("ui_down"), sehingga jika salah satu aksi ini aktif, animasi berjalan tidak dimainkan.

## Referensi
Sprite animasi : https://www.spriters-resource.com/pc_computer/mikunpop/sheet/46493/
