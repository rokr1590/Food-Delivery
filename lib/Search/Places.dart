
class Place{
  final String title;
  final String urlImage;
  final String placeadd;

  const Place({
    required this.title,
    required this.urlImage,
    required this.placeadd
  });
}

const allPlaces =[
  Place(title: 'Hungry Station', urlImage: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT8pyImMuzDSGe0pRD3CSjS2sYeQgGQcDeSHQ&usqp=CAU', placeadd: 'Jail road,Zinda Bazar,Sylhet'),
  Place(title: 'Artisan Coffee Shop', urlImage: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT8pyImMuzDSGe0pRD3CSjS2sYeQgGQcDeSHQ&usqp=CAU', placeadd: 'Mira bazar,Sylhet'),
  Place(title: 'Hungry Station', urlImage: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQk5i1liGKYiNuX4TevtYzvJ0zDIhXK75XqSQ&usqp=CAU', placeadd: 'Zindabazar road,Sylhet')
];