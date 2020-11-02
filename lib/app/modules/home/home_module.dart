import 'package:precificacaodeprojetos/app/modules/home/pages/budgets_view/budgets_view_controller.dart';
import 'package:precificacaodeprojetos/app/modules/home/pages/budgets_view/budgets_view_page.dart';
import 'package:precificacaodeprojetos/app/modules/home/pages/info/info_page.dart';
import 'package:precificacaodeprojetos/app/modules/home/pages/parcial_review/parcial_review_controller.dart';
import 'package:precificacaodeprojetos/app/modules/home/pages/parcial_review/parcial_review_page.dart';
import 'package:precificacaodeprojetos/app/modules/home/pages/splashScreen/splashScreen_page.dart';
import 'package:precificacaodeprojetos/app/modules/home/pages/levantamentoCadastral/levantamentoCadastral_page.dart';
import 'package:precificacaodeprojetos/app/modules/home/pages/projetoArquitetonico/projetoArquitetonico_page.dart';
import 'package:precificacaodeprojetos/app/modules/home/pages/projetoEletrico/projetoEletrico_page.dart';
import 'package:precificacaodeprojetos/app/modules/home/pages/projetoHidrossanitario/projetoHidrossanitario_page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:precificacaodeprojetos/app/modules/home/home_page.dart';
import 'package:precificacaodeprojetos/app/modules/home/pages/projetoPanico/projetoPanico_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => BudgetsViewController()),
        Bind((i) => ParcialReviewController()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/', child: (_, args) => SplashScreenPage()),
        ModularRouter('/home', child: (_, args) => HomePage()),
        ModularRouter('/levantamento',
            child: (_, args) => LevantamentoCadastralPage(), transition: TransitionType.fadeIn),
        ModularRouter('/arquitetonico',
            child: (_, args) => ProjetoArquitetonicoPage(), transition: TransitionType.fadeIn),
        ModularRouter('/eletrico', child: (_, args) => ProjetoEletricoPage(), transition: TransitionType.fadeIn),
        ModularRouter('/hidro', child: (_, args) => ProjetoHidrossanitarioPage(), transition: TransitionType.fadeIn),
        ModularRouter('/panico', child: (_, args) => ProjetoPanicoPage(), transition: TransitionType.fadeIn),
        ModularRouter('/parcialReview', child: (_, args) => ParcialReviewPage()),
        ModularRouter('/budgetView', child: (_, args) => BudgetsViewPage()),
        ModularRouter('/info', child: (_, args) => InfoPage()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
