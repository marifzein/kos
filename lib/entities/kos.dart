import 'package:objectbox/objectbox.dart';

@Entity()
class Kota {
  int id;
  final int idPropinsi;
  final String nama;

  Kota({this.id = 0, this.idPropinsi = 0, this.nama = ""});
}

@Entity()
class Propinsi {
  int id;
  final String nama;

  Propinsi({
    this.id = 0,
    this.nama = "",
  });
}

@Entity()
class Pemilik {
  int id;
  String namapemilik;
  String password;
  String alamat;
  int kota;
  int propinsi;
  @Unique()
  String hp;
  @Unique()
  String email;
  Pemilik(
      {this.id = 0,
      this.namapemilik = "",
      this.password = "",
      this.alamat = "",
      this.kota = 0,
      this.propinsi = 0,
      this.hp = "",
      this.email = ""});
}

@Entity()
class Properti {
  int id;
  int pemilikId;
  final String nama;
  final String alamat;
  final int kota;
  final int propinsi;

  Properti(
      {this.id = 0,
      this.pemilikId = 0,
      this.nama = "",
      this.alamat = "",
      this.kota = 0,
      this.propinsi = 0});
}

@Entity()
class TipeKamar {
  int id;
  int propertiId;
  final String nama;
  final String alamat;
  final int kota;
  final int propinsi;

  TipeKamar(
      {this.id = 0,
      this.propertiId = 0,
      this.nama = "",
      this.alamat = "",
      this.kota = 0,
      this.propinsi = 0});
}

@Entity()
class Penghuni {
  int id;
  final int idTipeKamar;
  final String nama;
  @Unique()
  final String noIdentitas;
  final DateTime tgLahir;
  final String alamat;
  final int idKota;
  final int idPropinsi;
  @Unique()
  final String hp;
  String pekerjaan;

  //final now = DateTime.now();
  Penghuni(
      {this.id = 0,
      this.idTipeKamar = 0,
      required this.nama,
      required this.noIdentitas,
      required this.tgLahir,
      required this.alamat,
      required this.idKota,
      required this.idPropinsi,
      required this.hp,
      this.pekerjaan = ""});
}

@Entity()
class Pembayaran {
  int id;
  @Property(type: PropertyType.date)
  final DateTime? tglBayar;
  @Property(type: PropertyType.date)
  final DateTime? tglcekin;
  @Property(type: PropertyType.date)
  final DateTime? tglcekout;
  final int idpenghuni;
  final int typebayar; //(1:cash,2:qris,3:trfr)
  final String nominalbayar;

  Pembayaran(
      {this.id = 0,
      required this.tglBayar,
      required this.tglcekin,
      required this.tglcekout,
      required this.idpenghuni,
      required this.typebayar,
      required this.nominalbayar});
}
