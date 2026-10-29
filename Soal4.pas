program Soal4;
uses crt;

var
  tugas, kuis, uts, uas : array[1..5] of real;   { nilai tiap komponen, maksimal 5 mahasiswa }
  n, i : integer;                                { n = jumlah mahasiswa, i = penghitung perulangan }
  rata : real;                                   { nilai rata-rata satu mahasiswa }

begin
  clrscr;

  { Input jumlah mahasiswa, diulang sampai berada di rentang 1 sampai 5
    (sesuai ukuran array) }
  repeat
    write('Masukkan jumlah mahasiswa (1-5): ');
    readln(n);
    if (n < 1) or (n > 5) then
      writeln('Jumlah harus antara 1 sampai 5!');
  until (n >= 1) and (n <= 5);

  writeln;

  { Input keempat nilai untuk setiap mahasiswa.
    Tiap nilai punya perulangan validasinya sendiri, jadi jika salah satu
    nilai tidak valid, hanya nilai itu yang diminta ulang. }
  for i := 1 to n do
  begin
    writeln('Masukkan nilai-nilai mahasiswa ke-', i);

    { Nilai Tugas }
    repeat
      write('  Nilai Tugas (0-100) : ');
      readln(tugas[i]);
      if (tugas[i] < 0) or (tugas[i] > 100) then
        writeln('  Nilai harus antara 0 sampai 100!');
    until (tugas[i] >= 0) and (tugas[i] <= 100);

    { Nilai Kuis }
    repeat
      write('  Nilai Kuis  (0-100) : ');
      readln(kuis[i]);
      if (kuis[i] < 0) or (kuis[i] > 100) then
        writeln('  Nilai harus antara 0 sampai 100!');
    until (kuis[i] >= 0) and (kuis[i] <= 100);

    { Nilai UTS }
    repeat
      write('  Nilai UTS   (0-100) : ');
      readln(uts[i]);
      if (uts[i] < 0) or (uts[i] > 100) then
        writeln('  Nilai harus antara 0 sampai 100!');
    until (uts[i] >= 0) and (uts[i] <= 100);

    { Nilai UAS }
    repeat
      write('  Nilai UAS   (0-100) : ');
      readln(uas[i]);
      if (uas[i] < 0) or (uas[i] > 100) then
        writeln('  Nilai harus antara 0 sampai 100!');
    until (uas[i] >= 0) and (uas[i] <= 100);

    writeln;
  end;

  { Tampilkan tabel hasil: judul kolom dibuat rata dengan format lebar kolom }
  clrscr;
  writeln('=========================================================');
  writeln('No', 'Tugas':8, 'Kuis':8, 'UTS':8, 'UAS':8, 'Rata-rata':11, '  ', 'Keterangan');
  writeln('=========================================================');
  for i := 1 to n do
  begin
    { Rata-rata = jumlah keempat nilai dibagi 4 }
    rata := (tugas[i] + kuis[i] + uts[i] + uas[i]) / 4;

    { Cetak nomor, keempat nilai, dan rata-rata (dua angka di belakang koma) }
    write(i:2, tugas[i]:8:2, kuis[i]:8:2, uts[i]:8:2, uas[i]:8:2, rata:11:2, '  ');

    { Penentuan keterangan: lulus jika rata-rata minimal 70.
      Pengurangan 0.000001 dipakai sebagai toleransi, karena bilangan real
      bisa memiliki selisih sangat kecil akibat pembulatan sehingga nilai
      yang seharusnya tepat 70 tidak salah dianggap kurang dari 70. }
    if rata >= 70 - 0.000001 then
      writeln('Lulus')
    else
      writeln('Tidak Lulus');
  end;
  writeln('=========================================================');

  readln;   { menahan layar agar hasil tidak langsung tertutup }
end.
