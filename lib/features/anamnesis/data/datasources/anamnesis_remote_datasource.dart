import 'package:cardiac_petct/features/anamnesis/data/models/anamnesis_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

abstract class AnamnesisRemoteDatasource {
  Future<void> sendAnamnesis(AnamnesisModel anamnesisModel);
}

class AnamnesisRemoteDatasourceImp extends AnamnesisRemoteDatasource {
  late final FirebaseAuth firebaseAuth;
  late final FirebaseDatabase firebaseDatabase;
  AnamnesisRemoteDatasourceImp() : super() {
    init();
  }

  init() {
    firebaseAuth = FirebaseAuth.instance;
    firebaseDatabase = FirebaseDatabase.instance;
  }

  @override
  Future<void> sendAnamnesis(AnamnesisModel anamnesisModel) async {
    try {
      final firebaseUser = firebaseAuth.currentUser;
      DatabaseReference anamnesisRef = firebaseDatabase
          .ref()
          .child('AnamnesisForm')
          .child(firebaseUser!.uid);
      await anamnesisRef.set(anamnesisModel.toMap());
      await setAnamnesisComplete();
      firebaseAuth.currentUser!.reload();
    } on FirebaseAuthException {
      rethrow;
    }
  }

  Future<void> setAnamnesisComplete() async {
    final firebaseUser = firebaseAuth.currentUser;
    DatabaseReference anamnesisRef =
        firebaseDatabase.ref().child('Users').child(firebaseUser!.uid);
    await anamnesisRef.update({'anamnesisForm': true});
  }
}
