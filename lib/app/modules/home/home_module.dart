import 'package:precificacaodeprojetos/app/modules/home/services/notifications_service.dart';
import 'package:precificacaodeprojetos/app/modules/home/page/budgets_view/budgets_view_controller.dart';
import 'package:precificacaodeprojetos/app/modules/home/page/budgets_view/budgets_view_page.dart';
import 'package:precificacaodeprojetos/app/modules/home/services/firebase_service.dart';
import 'package:precificacaodeprojetos/app/app_module.dart';
import 'package:precificacaodeprojetos/app/modules/home/pages/parcial_review/parcial_review_controller.dart';
import 'package:precificacaodeprojetos/app/modules/home/pages/parcial_review/parcial_review_page.dart';
import 'package:precificacaodeprojetos/app/modules/home/pages/splashScreen/splashScreen_page.dart';
import 'package:precificacaodeprojetos/app/modules/home/services/local_storage_service.dart';
import 'package:precificacaodeprojetos/app/modules/home/pages/levantamentoCadastral/levantamentoCadastral_page.dart';
import 'package:precificacaodeprojetos/app/modules/home/pages/projetoArquitetonico/projetoArquitetonico_page.dart';
import 'package:precificacaodeprojetos/app/modules/home/pages/projetoEletrico/projetoEletrico_page.dart';
import 'package:precificacaodeprojetos/app/modules/home/pages/projetoHidrossanitario/projetoHidrossanitario_page.dart';
import 'package:precificacaodeprojetos/app/modules/home/pages/projetoPanico/projetoPanico_controller.dart';
import 'package:precificacaodeprojetos/app/modules/home/pages/projetoHidrossanitario/projetoHidrossanitario_controller.dart';
import 'package:precificacaodeprojetos/app/modules/home/pages/projetoEletrico/projetoEletrico_controller.dart';
import 'package:precificacaodeprojetos/app/modules/home/pages/projetoArquitetonico/projetoArquitetonico_controller.dart';
import 'package:precificacaodeprojetos/app/modules/home/pages/levantamentoCadastral/levantamentoCadastral_controller.dart';
import 'package:precificacaodeprojetos/app/modules/home/home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:precificacaodeprojetos/app/modules/home/home_page.dart';
import 'package:precificacaodeprojetos/app/modules/home/pages/projetoPanico/projetoPanico_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => NotificationsService()),
        Bind((i) => BudgetsViewController()),
        Bind((i) => FirebaseService()),
        Bind((i) => ParcialReviewController()),
        Bind((i) => LocalStorageService()),
        Bind((i) => ProjetoPanicoController()),
        Bind((i) => ProjetoHidrossanitarioController()),
        Bind((i) => ProjetoEletricoController()),
        Bind((i) => ProjetoArquitetonicoController()),
        Bind((i) => LevantamentoCadastralController()),
        Bind((i) => HomeController()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => SplashScreenPage()),
        Router('/home', child: (_, args) => HomePage()),
        Router('/levantamento',
            child: (_, args) => LevantamentoCadastralPage()),
        Router('/arquitetonico',
            child: (_, args) => ProjetoArquitetonicoPage()),
        Router('/eletrico', child: (_, args) => ProjetoEletricoPage()),
        Router('/hidro', child: (_, args) => ProjetoHidrossanitarioPage()),
        Router('/panico', child: (_, args) => ProjetoPanicoPage()),
        Router('/parcialReview', child: (_, args) => ParcialReviewPage()),
        Router('/budgetView', child: (_, args) => BudgetsViewPage()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
