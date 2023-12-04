class ProductService {
  final String label;
  final String name;
  final String? icon;
  final bool? home;
  ProductService(
      {required this.label, required this.name, this.icon, this.home});
}

List<ProductService> servicesList = [
  ProductService(
    label: 'A R T',
    name: '/services/housekeeping',
    icon: 'assets/icons/housekeeping.png',
    home: true,
  ),
  ProductService(
    label: 'Perkebunan',
    name: '/services/garden',
    icon: 'assets/icons/plant.png',
    home: true,
  ),
  ProductService(
    label: 'Dokter',
    name: '/services/doctor',
    icon: 'assets/icons/doctor.png',
    home: true,
  ),
  ProductService(
    label: 'Otomotif',
    name: '/services/aotomotive',
    icon: 'assets/icons/car.png',
    home: true,
  ),
  ProductService(
    label: 'Elektronik',
    name: '/services/electronic',
    icon: 'assets/icons/electronic.png',
    home: true,
  ),
  ProductService(
    label: 'Renovasi',
    name: '/services/renovation',
    icon: 'assets/icons/home.png',
    home: true,
  ),
  ProductService(
    label: 'Perbaikan Rumah',
    name: '/services/repair',
    icon: 'assets/icons/faucet.png',
    home: false,
  ),
  ProductService(
    label: 'Tukang Kayu',
    name: '/services/carpenter',
    icon: 'assets/icons/carpenter.png',
    home: false,
  ),
  ProductService(
    label: 'Jahit',
    name: '/services/tailor',
    icon: 'assets/icons/tailor.png',
    home: true,
  ),
  ProductService(
    label: 'Angkutan Barang',
    name: '/services/delivery',
    icon: 'assets/icons/delivery.png',
    home: true,
  ),
  ProductService(
    label: 'Fotografi',
    name: '/services/photography',
    icon: 'assets/icons/photography.png',
    home: true,
  ),
  ProductService(
    label: 'Wedding',
    name: '/services/wedding',
    icon: 'assets/icons/wedding.png',
    home: true,
  ),
  ProductService(
    label: 'Ulang Tahun',
    name: '/services/birthday',
    icon: 'assets/icons/cake.png',
    home: false,
  ),
  ProductService(
    label: 'Dekorasi',
    name: '/services/decoration',
    icon: 'assets/icons/balloons.png',
    home: false,
  ),
  ProductService(
    label: 'Catering',
    name: '/services/catering',
    icon: 'assets/icons/catering.png',
    home: false,
  ),
  ProductService(
    label: 'Cukur',
    name: '/services/haircut',
    icon: 'assets/icons/haircut.png',
    home: true,
  ),
  ProductService(
    label: 'Sampah',
    name: '/services/trash',
    icon: 'assets/icons/trash.png',
    home: true,
  ),
  ProductService(
    label: 'Lainnya',
    name: '/services/other',
    icon: 'assets/icons/question.png',
    home: false,
  ),
];
