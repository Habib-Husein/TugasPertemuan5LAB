program Soal3;
uses crt;

var
  nilai   : array[1..10] of real;   { menyimpan nilai UAS, maksimal 10 mahasiswa }
  n, i, j : integer;                { n = jumlah mahasiswa, i dan j = penghitung perulangan }
  temp    : real;                   { variabel sementara untuk menukar dua nilai }

begin
  clrscr;

  { Input jumlah mahasiswa, diulang sampai berada di rentang 1 sampai 10
    (sesuai ukuran array) }
  repeat
    write('Masukkan jumlah mahasiswa (1-10): ');
    readln(n);
    if (n < 1) or (n > 10) then
      writeln('Jumlah harus antara 1 sampai 10!');
  until (n >= 1) and (n <= 10);

  writeln;

  { Input nilai UAS setiap mahasiswa, diulang sampai nilainya valid (0-100) }
  for i := 1 to n do
  begin
    repeat
      write('Masukkan nilai UAS mahasiswa ke-', i, ' (0-100): ');
      readln(nilai[i]);
      if (nilai[i] < 0) or (nilai[i] > 100) then
        writeln('Nilai harus antara 0 sampai 100!');
    until (nilai[i] >= 0) and (nilai[i] <= 100);
  end;

  { Pengurutan dengan Bubble Sort (ascending).
    Perulangan luar (i) menentukan banyaknya putaran, yaitu n-1 putaran.
    Perulangan dalam (j) membandingkan pasangan nilai yang bersebelahan.
    Setiap putaran selesai, nilai terbesar "naik" ke posisi paling akhir,
    sehingga batas perbandingan bisa dikurangi satu (n - i). }
  for i := 1 to n - 1 do
  begin
    for j := 1 to n - i do
    begin
      { Jika nilai kiri lebih besar dari nilai kanan, tukar posisinya }
      if nilai[j] > nilai[j + 1] then
      begin
        temp         := nilai[j];
        nilai[j]     := nilai[j + 1];
        nilai[j + 1] := temp;
      end;
    end;
  end;

  { Tampilkan hasil pengurutan dengan dua angka di belakang koma }
  clrscr;
  writeln('Nilai UAS setelah diurutkan (terendah ke tertinggi):');
  for i := 1 to n do
  begin
    writeln(i, '. ', nilai[i]:0:2);
  end;

  readln;   { menahan layar agar hasil tidak langsung tertutup }
end.
