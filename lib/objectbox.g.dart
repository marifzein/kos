// GENERATED CODE - DO NOT MODIFY BY HAND
// This code was generated by ObjectBox. To update it run the generator again
// with `dart run build_runner build`.
// See also https://docs.objectbox.io/getting-started#generate-objectbox-code

// ignore_for_file: camel_case_types, depend_on_referenced_packages
// coverage:ignore-file

import 'dart:typed_data';

import 'package:flat_buffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'
    as obx_int; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart' as obx;
import 'package:objectbox_flutter_libs/objectbox_flutter_libs.dart';

import 'entities/kos.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <obx_int.ModelEntity>[
  obx_int.ModelEntity(
      id: const obx_int.IdUid(1, 5233509218129212925),
      name: 'Kota',
      lastPropertyId: const obx_int.IdUid(3, 6331439180886849182),
      flags: 0,
      properties: <obx_int.ModelProperty>[
        obx_int.ModelProperty(
            id: const obx_int.IdUid(1, 4443543510187472688),
            name: 'id',
            type: 6,
            flags: 1),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(2, 5394644993808375998),
            name: 'idPropinsi',
            type: 6,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(3, 6331439180886849182),
            name: 'nama',
            type: 9,
            flags: 0)
      ],
      relations: <obx_int.ModelRelation>[],
      backlinks: <obx_int.ModelBacklink>[]),
  obx_int.ModelEntity(
      id: const obx_int.IdUid(2, 3699609095258361710),
      name: 'Pembayaran',
      lastPropertyId: const obx_int.IdUid(7, 2979073095526097413),
      flags: 0,
      properties: <obx_int.ModelProperty>[
        obx_int.ModelProperty(
            id: const obx_int.IdUid(1, 1562143152199171844),
            name: 'id',
            type: 6,
            flags: 1),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(2, 3814482772852596365),
            name: 'tglBayar',
            type: 10,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(3, 3362299690526816984),
            name: 'tglcekin',
            type: 10,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(4, 8563908410927550284),
            name: 'tglcekout',
            type: 10,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(5, 8112728618374932147),
            name: 'idpenghuni',
            type: 6,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(6, 3982407232089728253),
            name: 'typebayar',
            type: 6,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(7, 2979073095526097413),
            name: 'nominalbayar',
            type: 9,
            flags: 0)
      ],
      relations: <obx_int.ModelRelation>[],
      backlinks: <obx_int.ModelBacklink>[]),
  obx_int.ModelEntity(
      id: const obx_int.IdUid(3, 4711097038263764464),
      name: 'Pemilik',
      lastPropertyId: const obx_int.IdUid(8, 7666741232702495889),
      flags: 0,
      properties: <obx_int.ModelProperty>[
        obx_int.ModelProperty(
            id: const obx_int.IdUid(1, 2479224807423711434),
            name: 'id',
            type: 6,
            flags: 1),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(2, 1754705969156483089),
            name: 'namapemilik',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(3, 5315382713849574158),
            name: 'password',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(4, 9000845526475537795),
            name: 'alamat',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(5, 48580008407864108),
            name: 'kota',
            type: 6,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(6, 8992574019344608474),
            name: 'propinsi',
            type: 6,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(7, 8357048200525013676),
            name: 'hp',
            type: 9,
            flags: 2080,
            indexId: const obx_int.IdUid(1, 8541607447165412436)),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(8, 7666741232702495889),
            name: 'email',
            type: 9,
            flags: 2080,
            indexId: const obx_int.IdUid(4, 1279954679340725697))
      ],
      relations: <obx_int.ModelRelation>[],
      backlinks: <obx_int.ModelBacklink>[]),
  obx_int.ModelEntity(
      id: const obx_int.IdUid(4, 6783120590079731947),
      name: 'Penghuni',
      lastPropertyId: const obx_int.IdUid(10, 3332326687405992540),
      flags: 0,
      properties: <obx_int.ModelProperty>[
        obx_int.ModelProperty(
            id: const obx_int.IdUid(1, 2749272874321082056),
            name: 'id',
            type: 6,
            flags: 1),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(2, 4081425722869910317),
            name: 'idTipeKamar',
            type: 6,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(3, 4822901537981307398),
            name: 'nama',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(4, 3067927041743085314),
            name: 'noIdentitas',
            type: 9,
            flags: 2080,
            indexId: const obx_int.IdUid(2, 4893111921700059964)),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(5, 6603121635708780870),
            name: 'tgLahir',
            type: 10,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(6, 6468602096729171324),
            name: 'alamat',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(7, 4096120346947062132),
            name: 'idKota',
            type: 6,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(8, 7358210886135090661),
            name: 'idPropinsi',
            type: 6,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(9, 731828528153889274),
            name: 'hp',
            type: 9,
            flags: 2080,
            indexId: const obx_int.IdUid(3, 7807404754081620903)),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(10, 3332326687405992540),
            name: 'pekerjaan',
            type: 9,
            flags: 0)
      ],
      relations: <obx_int.ModelRelation>[],
      backlinks: <obx_int.ModelBacklink>[]),
  obx_int.ModelEntity(
      id: const obx_int.IdUid(5, 2872221821237681070),
      name: 'Properti',
      lastPropertyId: const obx_int.IdUid(6, 1189222981697717626),
      flags: 0,
      properties: <obx_int.ModelProperty>[
        obx_int.ModelProperty(
            id: const obx_int.IdUid(1, 4839983741830959073),
            name: 'id',
            type: 6,
            flags: 1),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(2, 7039198446848518461),
            name: 'nama',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(3, 1096248180316245715),
            name: 'alamat',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(4, 6280113960158626571),
            name: 'kota',
            type: 6,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(5, 7820431980678664312),
            name: 'propinsi',
            type: 6,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(6, 1189222981697717626),
            name: 'pemilikId',
            type: 6,
            flags: 0)
      ],
      relations: <obx_int.ModelRelation>[],
      backlinks: <obx_int.ModelBacklink>[]),
  obx_int.ModelEntity(
      id: const obx_int.IdUid(6, 2592039783726973148),
      name: 'Propinsi',
      lastPropertyId: const obx_int.IdUid(2, 1319229573417460616),
      flags: 0,
      properties: <obx_int.ModelProperty>[
        obx_int.ModelProperty(
            id: const obx_int.IdUid(1, 4601416089109290301),
            name: 'id',
            type: 6,
            flags: 1),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(2, 1319229573417460616),
            name: 'nama',
            type: 9,
            flags: 0)
      ],
      relations: <obx_int.ModelRelation>[],
      backlinks: <obx_int.ModelBacklink>[]),
  obx_int.ModelEntity(
      id: const obx_int.IdUid(7, 3651794904217840438),
      name: 'TipeKamar',
      lastPropertyId: const obx_int.IdUid(6, 2443444354731438327),
      flags: 0,
      properties: <obx_int.ModelProperty>[
        obx_int.ModelProperty(
            id: const obx_int.IdUid(1, 2115157674631956296),
            name: 'id',
            type: 6,
            flags: 1),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(2, 8248794739035063451),
            name: 'nama',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(3, 5707365600004355893),
            name: 'alamat',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(4, 2319528895446711692),
            name: 'kota',
            type: 6,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(5, 2525400172940867377),
            name: 'propinsi',
            type: 6,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(6, 2443444354731438327),
            name: 'propertiId',
            type: 6,
            flags: 0)
      ],
      relations: <obx_int.ModelRelation>[],
      backlinks: <obx_int.ModelBacklink>[])
];

/// Shortcut for [obx.Store.new] that passes [getObjectBoxModel] and for Flutter
/// apps by default a [directory] using `defaultStoreDirectory()` from the
/// ObjectBox Flutter library.
///
/// Note: for desktop apps it is recommended to specify a unique [directory].
///
/// See [obx.Store.new] for an explanation of all parameters.
///
/// For Flutter apps, also calls `loadObjectBoxLibraryAndroidCompat()` from
/// the ObjectBox Flutter library to fix loading the native ObjectBox library
/// on Android 6 and older.
Future<obx.Store> openStore(
    {String? directory,
    int? maxDBSizeInKB,
    int? maxDataSizeInKB,
    int? fileMode,
    int? maxReaders,
    bool queriesCaseSensitiveDefault = true,
    String? macosApplicationGroup}) async {
  await loadObjectBoxLibraryAndroidCompat();
  return obx.Store(getObjectBoxModel(),
      directory: directory ?? (await defaultStoreDirectory()).path,
      maxDBSizeInKB: maxDBSizeInKB,
      maxDataSizeInKB: maxDataSizeInKB,
      fileMode: fileMode,
      maxReaders: maxReaders,
      queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
      macosApplicationGroup: macosApplicationGroup);
}

/// Returns the ObjectBox model definition for this project for use with
/// [obx.Store.new].
obx_int.ModelDefinition getObjectBoxModel() {
  final model = obx_int.ModelInfo(
      entities: _entities,
      lastEntityId: const obx_int.IdUid(7, 3651794904217840438),
      lastIndexId: const obx_int.IdUid(4, 1279954679340725697),
      lastRelationId: const obx_int.IdUid(0, 0),
      lastSequenceId: const obx_int.IdUid(0, 0),
      retiredEntityUids: const [],
      retiredIndexUids: const [],
      retiredPropertyUids: const [],
      retiredRelationUids: const [],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, obx_int.EntityDefinition>{
    Kota: obx_int.EntityDefinition<Kota>(
        model: _entities[0],
        toOneRelations: (Kota object) => [],
        toManyRelations: (Kota object) => {},
        getId: (Kota object) => object.id,
        setId: (Kota object, int id) {
          object.id = id;
        },
        objectToFB: (Kota object, fb.Builder fbb) {
          final namaOffset = fbb.writeString(object.nama);
          fbb.startTable(4);
          fbb.addInt64(0, object.id);
          fbb.addInt64(1, object.idPropinsi);
          fbb.addOffset(2, namaOffset);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (obx.Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final idParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);
          final idPropinsiParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 6, 0);
          final namaParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 8, '');
          final object =
              Kota(id: idParam, idPropinsi: idPropinsiParam, nama: namaParam);

          return object;
        }),
    Pembayaran: obx_int.EntityDefinition<Pembayaran>(
        model: _entities[1],
        toOneRelations: (Pembayaran object) => [],
        toManyRelations: (Pembayaran object) => {},
        getId: (Pembayaran object) => object.id,
        setId: (Pembayaran object, int id) {
          object.id = id;
        },
        objectToFB: (Pembayaran object, fb.Builder fbb) {
          final nominalbayarOffset = fbb.writeString(object.nominalbayar);
          fbb.startTable(8);
          fbb.addInt64(0, object.id);
          fbb.addInt64(1, object.tglBayar?.millisecondsSinceEpoch);
          fbb.addInt64(2, object.tglcekin?.millisecondsSinceEpoch);
          fbb.addInt64(3, object.tglcekout?.millisecondsSinceEpoch);
          fbb.addInt64(4, object.idpenghuni);
          fbb.addInt64(5, object.typebayar);
          fbb.addOffset(6, nominalbayarOffset);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (obx.Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final tglBayarValue =
              const fb.Int64Reader().vTableGetNullable(buffer, rootOffset, 6);
          final tglcekinValue =
              const fb.Int64Reader().vTableGetNullable(buffer, rootOffset, 8);
          final tglcekoutValue =
              const fb.Int64Reader().vTableGetNullable(buffer, rootOffset, 10);
          final idParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);
          final tglBayarParam = tglBayarValue == null
              ? null
              : DateTime.fromMillisecondsSinceEpoch(tglBayarValue);
          final tglcekinParam = tglcekinValue == null
              ? null
              : DateTime.fromMillisecondsSinceEpoch(tglcekinValue);
          final tglcekoutParam = tglcekoutValue == null
              ? null
              : DateTime.fromMillisecondsSinceEpoch(tglcekoutValue);
          final idpenghuniParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 12, 0);
          final typebayarParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 14, 0);
          final nominalbayarParam =
              const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 16, '');
          final object = Pembayaran(
              id: idParam,
              tglBayar: tglBayarParam,
              tglcekin: tglcekinParam,
              tglcekout: tglcekoutParam,
              idpenghuni: idpenghuniParam,
              typebayar: typebayarParam,
              nominalbayar: nominalbayarParam);

          return object;
        }),
    Pemilik: obx_int.EntityDefinition<Pemilik>(
        model: _entities[2],
        toOneRelations: (Pemilik object) => [],
        toManyRelations: (Pemilik object) => {},
        getId: (Pemilik object) => object.id,
        setId: (Pemilik object, int id) {
          object.id = id;
        },
        objectToFB: (Pemilik object, fb.Builder fbb) {
          final namapemilikOffset = fbb.writeString(object.namapemilik);
          final passwordOffset = fbb.writeString(object.password);
          final alamatOffset = fbb.writeString(object.alamat);
          final hpOffset = fbb.writeString(object.hp);
          final emailOffset = fbb.writeString(object.email);
          fbb.startTable(9);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, namapemilikOffset);
          fbb.addOffset(2, passwordOffset);
          fbb.addOffset(3, alamatOffset);
          fbb.addInt64(4, object.kota);
          fbb.addInt64(5, object.propinsi);
          fbb.addOffset(6, hpOffset);
          fbb.addOffset(7, emailOffset);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (obx.Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final idParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);
          final namapemilikParam =
              const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 6, '');
          final passwordParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 8, '');
          final alamatParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 10, '');
          final kotaParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 12, 0);
          final propinsiParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 14, 0);
          final hpParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 16, '');
          final emailParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 18, '');
          final object = Pemilik(
              id: idParam,
              namapemilik: namapemilikParam,
              password: passwordParam,
              alamat: alamatParam,
              kota: kotaParam,
              propinsi: propinsiParam,
              hp: hpParam,
              email: emailParam);

          return object;
        }),
    Penghuni: obx_int.EntityDefinition<Penghuni>(
        model: _entities[3],
        toOneRelations: (Penghuni object) => [],
        toManyRelations: (Penghuni object) => {},
        getId: (Penghuni object) => object.id,
        setId: (Penghuni object, int id) {
          object.id = id;
        },
        objectToFB: (Penghuni object, fb.Builder fbb) {
          final namaOffset = fbb.writeString(object.nama);
          final noIdentitasOffset = fbb.writeString(object.noIdentitas);
          final alamatOffset = fbb.writeString(object.alamat);
          final hpOffset = fbb.writeString(object.hp);
          final pekerjaanOffset = fbb.writeString(object.pekerjaan);
          fbb.startTable(11);
          fbb.addInt64(0, object.id);
          fbb.addInt64(1, object.idTipeKamar);
          fbb.addOffset(2, namaOffset);
          fbb.addOffset(3, noIdentitasOffset);
          fbb.addInt64(4, object.tgLahir.millisecondsSinceEpoch);
          fbb.addOffset(5, alamatOffset);
          fbb.addInt64(6, object.idKota);
          fbb.addInt64(7, object.idPropinsi);
          fbb.addOffset(8, hpOffset);
          fbb.addOffset(9, pekerjaanOffset);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (obx.Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final idParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);
          final idTipeKamarParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 6, 0);
          final namaParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 8, '');
          final noIdentitasParam =
              const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 10, '');
          final tgLahirParam = DateTime.fromMillisecondsSinceEpoch(
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 12, 0));
          final alamatParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 14, '');
          final idKotaParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 16, 0);
          final idPropinsiParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 18, 0);
          final hpParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 20, '');
          final pekerjaanParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 22, '');
          final object = Penghuni(
              id: idParam,
              idTipeKamar: idTipeKamarParam,
              nama: namaParam,
              noIdentitas: noIdentitasParam,
              tgLahir: tgLahirParam,
              alamat: alamatParam,
              idKota: idKotaParam,
              idPropinsi: idPropinsiParam,
              hp: hpParam,
              pekerjaan: pekerjaanParam);

          return object;
        }),
    Properti: obx_int.EntityDefinition<Properti>(
        model: _entities[4],
        toOneRelations: (Properti object) => [],
        toManyRelations: (Properti object) => {},
        getId: (Properti object) => object.id,
        setId: (Properti object, int id) {
          object.id = id;
        },
        objectToFB: (Properti object, fb.Builder fbb) {
          final namaOffset = fbb.writeString(object.nama);
          final alamatOffset = fbb.writeString(object.alamat);
          fbb.startTable(7);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, namaOffset);
          fbb.addOffset(2, alamatOffset);
          fbb.addInt64(3, object.kota);
          fbb.addInt64(4, object.propinsi);
          fbb.addInt64(5, object.pemilikId);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (obx.Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final idParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);
          final pemilikIdParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 14, 0);
          final namaParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 6, '');
          final alamatParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 8, '');
          final kotaParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 10, 0);
          final propinsiParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 12, 0);
          final object = Properti(
              id: idParam,
              pemilikId: pemilikIdParam,
              nama: namaParam,
              alamat: alamatParam,
              kota: kotaParam,
              propinsi: propinsiParam);

          return object;
        }),
    Propinsi: obx_int.EntityDefinition<Propinsi>(
        model: _entities[5],
        toOneRelations: (Propinsi object) => [],
        toManyRelations: (Propinsi object) => {},
        getId: (Propinsi object) => object.id,
        setId: (Propinsi object, int id) {
          object.id = id;
        },
        objectToFB: (Propinsi object, fb.Builder fbb) {
          final namaOffset = fbb.writeString(object.nama);
          fbb.startTable(3);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, namaOffset);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (obx.Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final idParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);
          final namaParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 6, '');
          final object = Propinsi(id: idParam, nama: namaParam);

          return object;
        }),
    TipeKamar: obx_int.EntityDefinition<TipeKamar>(
        model: _entities[6],
        toOneRelations: (TipeKamar object) => [],
        toManyRelations: (TipeKamar object) => {},
        getId: (TipeKamar object) => object.id,
        setId: (TipeKamar object, int id) {
          object.id = id;
        },
        objectToFB: (TipeKamar object, fb.Builder fbb) {
          final namaOffset = fbb.writeString(object.nama);
          final alamatOffset = fbb.writeString(object.alamat);
          fbb.startTable(7);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, namaOffset);
          fbb.addOffset(2, alamatOffset);
          fbb.addInt64(3, object.kota);
          fbb.addInt64(4, object.propinsi);
          fbb.addInt64(5, object.propertiId);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (obx.Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final idParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);
          final propertiIdParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 14, 0);
          final namaParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 6, '');
          final alamatParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 8, '');
          final kotaParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 10, 0);
          final propinsiParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 12, 0);
          final object = TipeKamar(
              id: idParam,
              propertiId: propertiIdParam,
              nama: namaParam,
              alamat: alamatParam,
              kota: kotaParam,
              propinsi: propinsiParam);

          return object;
        })
  };

  return obx_int.ModelDefinition(model, bindings);
}

/// [Kota] entity fields to define ObjectBox queries.
class Kota_ {
  /// See [Kota.id].
  static final id = obx.QueryIntegerProperty<Kota>(_entities[0].properties[0]);

  /// See [Kota.idPropinsi].
  static final idPropinsi =
      obx.QueryIntegerProperty<Kota>(_entities[0].properties[1]);

  /// See [Kota.nama].
  static final nama = obx.QueryStringProperty<Kota>(_entities[0].properties[2]);
}

/// [Pembayaran] entity fields to define ObjectBox queries.
class Pembayaran_ {
  /// See [Pembayaran.id].
  static final id =
      obx.QueryIntegerProperty<Pembayaran>(_entities[1].properties[0]);

  /// See [Pembayaran.tglBayar].
  static final tglBayar =
      obx.QueryDateProperty<Pembayaran>(_entities[1].properties[1]);

  /// See [Pembayaran.tglcekin].
  static final tglcekin =
      obx.QueryDateProperty<Pembayaran>(_entities[1].properties[2]);

  /// See [Pembayaran.tglcekout].
  static final tglcekout =
      obx.QueryDateProperty<Pembayaran>(_entities[1].properties[3]);

  /// See [Pembayaran.idpenghuni].
  static final idpenghuni =
      obx.QueryIntegerProperty<Pembayaran>(_entities[1].properties[4]);

  /// See [Pembayaran.typebayar].
  static final typebayar =
      obx.QueryIntegerProperty<Pembayaran>(_entities[1].properties[5]);

  /// See [Pembayaran.nominalbayar].
  static final nominalbayar =
      obx.QueryStringProperty<Pembayaran>(_entities[1].properties[6]);
}

/// [Pemilik] entity fields to define ObjectBox queries.
class Pemilik_ {
  /// See [Pemilik.id].
  static final id =
      obx.QueryIntegerProperty<Pemilik>(_entities[2].properties[0]);

  /// See [Pemilik.namapemilik].
  static final namapemilik =
      obx.QueryStringProperty<Pemilik>(_entities[2].properties[1]);

  /// See [Pemilik.password].
  static final password =
      obx.QueryStringProperty<Pemilik>(_entities[2].properties[2]);

  /// See [Pemilik.alamat].
  static final alamat =
      obx.QueryStringProperty<Pemilik>(_entities[2].properties[3]);

  /// See [Pemilik.kota].
  static final kota =
      obx.QueryIntegerProperty<Pemilik>(_entities[2].properties[4]);

  /// See [Pemilik.propinsi].
  static final propinsi =
      obx.QueryIntegerProperty<Pemilik>(_entities[2].properties[5]);

  /// See [Pemilik.hp].
  static final hp =
      obx.QueryStringProperty<Pemilik>(_entities[2].properties[6]);

  /// See [Pemilik.email].
  static final email =
      obx.QueryStringProperty<Pemilik>(_entities[2].properties[7]);
}

/// [Penghuni] entity fields to define ObjectBox queries.
class Penghuni_ {
  /// See [Penghuni.id].
  static final id =
      obx.QueryIntegerProperty<Penghuni>(_entities[3].properties[0]);

  /// See [Penghuni.idTipeKamar].
  static final idTipeKamar =
      obx.QueryIntegerProperty<Penghuni>(_entities[3].properties[1]);

  /// See [Penghuni.nama].
  static final nama =
      obx.QueryStringProperty<Penghuni>(_entities[3].properties[2]);

  /// See [Penghuni.noIdentitas].
  static final noIdentitas =
      obx.QueryStringProperty<Penghuni>(_entities[3].properties[3]);

  /// See [Penghuni.tgLahir].
  static final tgLahir =
      obx.QueryDateProperty<Penghuni>(_entities[3].properties[4]);

  /// See [Penghuni.alamat].
  static final alamat =
      obx.QueryStringProperty<Penghuni>(_entities[3].properties[5]);

  /// See [Penghuni.idKota].
  static final idKota =
      obx.QueryIntegerProperty<Penghuni>(_entities[3].properties[6]);

  /// See [Penghuni.idPropinsi].
  static final idPropinsi =
      obx.QueryIntegerProperty<Penghuni>(_entities[3].properties[7]);

  /// See [Penghuni.hp].
  static final hp =
      obx.QueryStringProperty<Penghuni>(_entities[3].properties[8]);

  /// See [Penghuni.pekerjaan].
  static final pekerjaan =
      obx.QueryStringProperty<Penghuni>(_entities[3].properties[9]);
}

/// [Properti] entity fields to define ObjectBox queries.
class Properti_ {
  /// See [Properti.id].
  static final id =
      obx.QueryIntegerProperty<Properti>(_entities[4].properties[0]);

  /// See [Properti.nama].
  static final nama =
      obx.QueryStringProperty<Properti>(_entities[4].properties[1]);

  /// See [Properti.alamat].
  static final alamat =
      obx.QueryStringProperty<Properti>(_entities[4].properties[2]);

  /// See [Properti.kota].
  static final kota =
      obx.QueryIntegerProperty<Properti>(_entities[4].properties[3]);

  /// See [Properti.propinsi].
  static final propinsi =
      obx.QueryIntegerProperty<Properti>(_entities[4].properties[4]);

  /// See [Properti.pemilikId].
  static final pemilikId =
      obx.QueryIntegerProperty<Properti>(_entities[4].properties[5]);
}

/// [Propinsi] entity fields to define ObjectBox queries.
class Propinsi_ {
  /// See [Propinsi.id].
  static final id =
      obx.QueryIntegerProperty<Propinsi>(_entities[5].properties[0]);

  /// See [Propinsi.nama].
  static final nama =
      obx.QueryStringProperty<Propinsi>(_entities[5].properties[1]);
}

/// [TipeKamar] entity fields to define ObjectBox queries.
class TipeKamar_ {
  /// See [TipeKamar.id].
  static final id =
      obx.QueryIntegerProperty<TipeKamar>(_entities[6].properties[0]);

  /// See [TipeKamar.nama].
  static final nama =
      obx.QueryStringProperty<TipeKamar>(_entities[6].properties[1]);

  /// See [TipeKamar.alamat].
  static final alamat =
      obx.QueryStringProperty<TipeKamar>(_entities[6].properties[2]);

  /// See [TipeKamar.kota].
  static final kota =
      obx.QueryIntegerProperty<TipeKamar>(_entities[6].properties[3]);

  /// See [TipeKamar.propinsi].
  static final propinsi =
      obx.QueryIntegerProperty<TipeKamar>(_entities[6].properties[4]);

  /// See [TipeKamar.propertiId].
  static final propertiId =
      obx.QueryIntegerProperty<TipeKamar>(_entities[6].properties[5]);
}