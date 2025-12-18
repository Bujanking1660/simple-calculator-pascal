program KalkulatorSederhana;

// Deklarasi Prosedur
procedure Detail;
begin
    // Menampilkan daftar operator yang tersedia
    writeln('(1) Penjumlahan ( + )'); // Informasi opsi untuk penjumlahan
    writeln('(2) Pengurangan ( - )'); // Informasi opsi untuk pengurangan
    writeln('(3) Perkalian   ( x )'); // Informasi opsi untuk perkalian
    writeln('(4) Pembagian   ( : )'); // Informasi opsi untuk pembagian
    writeln('(0) Keluar Program');    // Informasi opsi untuk keluar program
end;

// Kamus
var
    // Variabel utama
    JumlahAngka, i: Integer;        // `JumlahAngka` menyimpan jumlah angka yang akan digunakan dalam operasi,
                                    // `i` digunakan sebagai penghitung pada perulangan.
    Hasil, AngkaSelanjutnya: Real;  // `Hasil` menyimpan hasil sementara atau akhir dari operasi,
                                    // `AngkaSelanjutnya` menyimpan angka kedua/selanjutnya dalam operasi.
    Opr: Char;                      // `Opr` digunakan untuk menyimpan operator matematika yang dimasukkan pengguna.

    // Variabel sementara
    Kondisi: Boolean;               // `Kondisi` untuk validasi masukkan, bernilai True jika input valid.
    InputStr: String;               // `InputStr` menyimpan input sementara sebagai string untuk validasi.
    Error: Integer;                 // `Error` digunakan untuk mendeteksi kesalahan saat mengonversi string menjadi angka.

// Badan Program
begin
    // Menampilkan header atau judul program
    writeln('==============================================================');
    writeln('<<<<<<<<<<<<< ------ KALKULATOR SEDERHANA ------ >>>>>>>>>>>>>');
    writeln('==============================================================');

    // Memanggil prosedur `Detail` untuk menampilkan daftar opsi operator
    Detail;

    // Meminta pengguna untuk memasukkan jumlah angka yang akan digunakan
    write('Masukkan jumlah angka: '); // Menampilkan ke layar untuk meminta masukkan
    readln(JumlahAngka);              // Menentukan jumlah angka dari pengguna

    // Melakukan validasi memastikan jumlah angka minimal 2
    while JumlahAngka < 2 do
    begin
        // Menampilkan pesan kesalahan jika jumlah angka kurang dari 2
        writeln('Jumlah angka minimal 2. Silakan coba lagi.');
        write('Masukkan jumlah angka: '); // Meminta ulang input jumlah angka
        readln(JumlahAngka);              // Menentukan ulang jumlah angka dari pengguna
    end;

    // Menentukan angka pertama
    Kondisi := False; // Inisialisasi `Kondisi` menjadi False untuk memulai validasi
    while not Kondisi do
    begin
        write('Masukkan angka pertama: '); // Menampilkan untuk meminta angka pertama
        readln(InputStr);                  // Menentukan angka pertama dalam bentuk string
        Val(InputStr, Hasil, Error);       // Mengonversi string menjadi angka dan memeriksa kesalahan
        if Error = 0 then
            Kondisi := True // Jika angka sesuai tipe data, keluar dari loop
        else
            writeln('Masukkan angka yang valid.'); // Pesan kesalahan jika masukkan tidak sesuai tipe data
    end;

    // Proses perulangan untuk angka berikutnya (mulai dari angka kedua)
    for i := 1 to JumlahAngka - 1 do
    begin
        // Meminta input operator yang sesuai tipe data
        Kondisi := False; // Inisialisasi `Kondisi` untuk validasi operator
        while not Kondisi do
        begin
            write('Masukkan operator (+, -, x, :): '); // Menampilkan perintah memasukkan operator
            readln(Opr);                               // Menentukan operator
            if (Opr = '+') or (Opr = '-') or (Opr = 'x') or (Opr = ':') then
                Kondisi := True // Jika operator sesuai tipe data, keluar dari loop
            else
                writeln('Operator tidak valid. Silakan coba lagi.'); // Pesan kesalahan jika masukkan tidak sesuai tipe data
        end;

        // Meminta masukkan angka selanjutnya dan memvalidasinya
        Kondisi := False; // Inisialisasi `Kondisi` untuk validasi angka
        while not Kondisi do
        begin
            write('Masukkan angka ke-', i + 1, ': '); // Meminta angka selanjutnya (dengan nomor urut)
            readln(InputStr);                         // Membaca input angka sebagai string
            Val(InputStr, AngkaSelanjutnya, Error);   // Mengonversi string menjadi angka dan memvalidasi
            if Error = 0 then // Memastikan angka sesuuai tipe data
            begin
                if (Opr = ':') and (AngkaSelanjutnya = 0) then
                    writeln('Pembagian dengan nol tidak diperbolehkan. Silakan coba lagi.') // Validasi pembagian nol
                else
                    Kondisi := True; // Jika angka sesuai tipe data, keluar dari loop
            end
            else
                writeln('Masukkan angka yang valid.'); // Pesan kesalahan jika masukkan tidak sesuai tipe data
        end;

        // Melakukan operasi sesuai dengan operator yang dipilih
        if (Opr = '+') then
            Hasil := Hasil + AngkaSelanjutnya // Penjumlahan
        else
            if (Opr = '-') then
               Hasil := Hasil - AngkaSelanjutnya // Pengurangan
            else
                if (Opr = 'x') then
                   Hasil := Hasil * AngkaSelanjutnya // Perkalian
                else
                    if (Opr = ':') then
                       Hasil := Hasil / AngkaSelanjutnya; // Pembagian

        // Menampilkan hasil sementara setelah operasi
        writeln('Hasil sementara: ', Hasil:0:2);
    end;

    // Menampilkan hasil akhir setelah semua operasi selesai
    writeln('Hasil akhir: ', Hasil:0:2);
    readln; // Menunggu input sebelum program keluar
end.

