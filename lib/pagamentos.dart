class Pagamentos {
  int? id;
  int? refoId;
  int? adqId;
  int? codigoProduto;
  int? idTipoTransacao;
  String? tipoTransacao;
  String? empresa;
  String? cnpj;
  String? adquirente;
  String? dataVenda;
  String? dataPagamento;
  String? produto;
  int? idModalidade;
  String? modalidade;
  String? autorizacao;
  String? nsu;
  String? tid;
  String? nomeLoja;
  String? resumoVenda;
  String? cartao;
  double? valorBruto;
  double? taxa;
  double? valorTaxa;
  double? outrasDespesas;
  double? valorLiquido;
  int? parcela;
  int? banco;
  int? totalParcelas;
  String? agencia;
  String? conta;
  String? estabelecimento;
  String? observacao;
  String? motivoAjuste;
  bool? acelerado;
  bool? idtAntecipacao;
  String? terminal;
  String? contaAdquirente;
  String? dataPrevistaPagamento;
  String? idPagamento;
  double? valorLiquidoVenda;
  int? idStatus;
  String? status;
  String? divergencias;
  double? taxaAntecipacao;
  double? taxaAntecipacaoMensal;
  double? valorTaxaAntecipacao;
  bool? temConciliacaoBancaria;

  Pagamentos(
      {id,
      refoId,
      adqId,
      codigoProduto,
      idTipoTransacao,
      tipoTransacao,
      empresa,
      cnpj,
      adquirente,
      dataVenda,
      dataPagamento,
      produto,
      idModalidade,
      modalidade,
      autorizacao,
      nsu,
      tid,
      nomeLoja,
      resumoVenda,
      cartao,
      valorBruto,
      taxa,
      valorTaxa,
      outrasDespesas,
      valorLiquido,
      parcela,
      banco,
      totalParcelas,
      agencia,
      conta,
      estabelecimento,
      observacao,
      motivoAjuste,
      acelerado,
      idtAntecipacao,
      terminal,
      contaAdquirente,
      dataPrevistaPagamento,
      idPagamento,
      valorLiquidoVenda,
      idStatus,
      status,
      divergencias,
      taxaAntecipacao,
      taxaAntecipacaoMensal,
      valorTaxaAntecipacao,
      temConciliacaoBancaria});

  Pagamentos.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    refoId = json['RefoId'];
    adqId = json['AdqId'];
    codigoProduto = json['CodigoProduto'];
    idTipoTransacao = json['IdTipoTransacao'];
    tipoTransacao = json['TipoTransacao'];
    empresa = json['Empresa'];
    cnpj = json['Cnpj'];
    adquirente = json['Adquirente'];
    dataVenda = json['DataVenda'];
    dataPagamento = json['DataPagamento'];
    produto = json['Produto'];
    idModalidade = json['IdModalidade'];
    modalidade = json['Modalidade'];
    autorizacao = json['Autorizacao'];
    nsu = json['Nsu'];
    tid = json['Tid'];
    nomeLoja = json['NomeLoja'];
    resumoVenda = json['ResumoVenda'];
    cartao = json['Cartao'];
    valorBruto = json['ValorBruto'];
    taxa = json['Taxa'];
    valorTaxa = json['ValorTaxa'];
    outrasDespesas = json['OutrasDespesas'];
    valorLiquido = json['ValorLiquido'];
    parcela = json['Parcela'];
    banco = json['Banco'];
    totalParcelas = json['TotalParcelas'];
    agencia = json['Agencia'];
    conta = json['Conta'];
    estabelecimento = json['Estabelecimento'];
    observacao = json['Observacao'];
    motivoAjuste = json['MotivoAjuste'];
    acelerado = json['Acelerado'];
    idtAntecipacao = json['IdtAntecipacao'];
    terminal = json['Terminal'];
    contaAdquirente = json['ContaAdquirente'];
    dataPrevistaPagamento = json['DataPrevistaPagamento'];
    idPagamento = json['IdPagamento'];
    valorLiquidoVenda = json['ValorLiquidoVenda'];
    idStatus = json['IdStatus'];
    status = json['Status'];
    divergencias = json['Divergencias'];
    taxaAntecipacao = json['TaxaAntecipacao'];
    taxaAntecipacaoMensal = json['TaxaAntecipacaoMensal'];
    valorTaxaAntecipacao = json['ValorTaxaAntecipacao'];
    temConciliacaoBancaria = json['TemConciliacaoBancaria'];
  }

  static Pagamentos merge(Pagamentos existing, Pagamentos newItem) {
    return Pagamentos(
      empresa: existing.empresa,
      conta: existing.conta,
      produto: existing.produto,
      valorLiquidoVenda: existing.valorLiquido! + newItem.valorLiquido!,
    );
  }
}
