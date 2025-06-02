// lib/utils/app_data.dart
import '../models/product_model.dart';
import 'dart:convert';

const String productsJsonString = '''
{
  "produtos_halloween": [
    { "id": 1, "nome": "Abóbora Decorativa Luminosa", "emoji": "🎃", "descricao": "Abóbora artificial com luz LED interna, perfeita para decorar ambientes internos e externos durante o Halloween", "preco": 45.90 },
    { "id": 2, "nome": "Fantasia de Fantasma Clássico", "emoji": "👻", "descricao": "Roupa completa de fantasma com tecido branco flutuante e máscara assombrada", "preco": 35.50 },
    { "id": 3, "nome": "Kit Bruxa Completo", "emoji": "🧙‍♀️", "descricao": "Conjunto com chapéu pontudo, capa preta, varinha mágica e caldeirão decorativo", "preco": 89.90 },
    { "id": 4, "nome": "Capa de Vampiro Premium", "emoji": "🧛‍♂️", "descricao": "Capa elegante preta com forro vermelho, inclui dentes de vampiro e medalhão gótico", "preco": 125.00 },
    { "id": 5, "nome": "Morcegos Decorativos 3D", "emoji": "🦇", "descricao": "Pack com 12 morcegos de papel 3D para colar na parede e criar ambiente assombrado", "preco": 22.90 },
    { "id": 6, "nome": "Teia de Aranha Gigante", "emoji": "🕸️", "descricao": "Teia artificial extensível de até 2 metros, inclui aranha peluda realística", "preco": 38.50 },
    { "id": 7, "nome": "Caveira Luminosa com Sons", "emoji": "💀", "descricao": "Caveira decorativa com efeitos sonoros assombrados e iluminação que pisca", "preco": 65.90 },
    { "id": 8, "nome": "Poção Mágica Borbulhante", "emoji": "🧪", "descricao": "Kit para criar poções com efeito borbulhante e fumaça colorida, seguro para crianças", "preco": 42.00 },
    { "id": 9, "nome": "Bola de Cristal Mística", "emoji": "🔮", "descricao": "Bola de cristal com base ornamentada e luz LED que cria efeitos místicos", "preco": 78.90 },
    { "id": 10, "nome": "Velas Flutuantes Mágicas", "emoji": "🕯️", "descricao": "Conjunto de velas LED flutuantes com controle remoto para criar atmosfera mágica", "preco": 95.50 },
    { "id": 11, "nome": "Kit Zumbi Apocalipse", "emoji": "🧟‍♂️", "descricao": "Fantasia completa de zumbi com roupas rasgadas, maquiagem e sangue artificial", "preco": 115.90 },
    { "id": 12, "nome": "Máscara Assombrada Interativa", "emoji": "🎭", "descricao": "Máscara com sensores de movimento que emite sons e acende os olhos quando alguém se aproxima", "preco": 87.50 },
    { "id": 13, "nome": "Caldeirão de Doces Animado", "emoji": "🍬", "descricao": "Caldeirão decorativo que faz barulhos assombrados quando crianças pegam doces", "preco": 58.90 },
    { "id": 14, "nome": "Aranha Robótica Gigante", "emoji": "🕷️", "descricao": "Aranha motorizada de 30cm que se move sozinha e emite sons realísticos", "preco": 145.00 },
    { "id": 15, "nome": "Lápide Decorativa Personalizada", "emoji": "⚰️", "descricao": "Lápide de jardim personalizável com frases assombradas e acabamento envelhecido", "preco": 72.50 }
  ]
}
''';

List<Product> loadProducts() {
  final Map<String, dynamic> jsonData = json.decode(productsJsonString);
  final List<dynamic> productListJson = jsonData['produtos_halloween'];
  return productListJson.map((jsonItem) => Product.fromJson(jsonItem)).toList();
}

final List<Product> halloweenProducts = loadProducts();