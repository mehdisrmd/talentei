part of docLib;

class LocationSectionWidget extends StatefulWidget {
  const LocationSectionWidget({super.key});

  @override
  State<LocationSectionWidget> createState() => _LocationSectionWidgetState();
}

class _LocationSectionWidgetState extends State<LocationSectionWidget> {
  late MapZoomPanBehavior _zoomPanBehavior;
  MapTileLayerController _mapTileLayerController = MapTileLayerController();
  @override
  void initState() {
    super.initState();
    _zoomPanBehavior = MapZoomPanBehavior();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderSection(title: 'موقعیت مکانی مطب'),
          const SizedBox(height: 10),
          DoctorInfoSectionWidget.buildInfoItem(Icons.location_on,
              'آدرس: تهران، پاسداران، خیابان گلستان، پلاک ۶۵'),
          DoctorInfoSectionWidget.buildInfoItem(
              Icons.phone, 'تلفن: ۰۲۱۸۸۷۶۵۴۳۲'),
          const SizedBox(height: 10),
          Container(
              height: 120,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.teal[100],
                borderRadius: BorderRadius.circular(10),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: InkWell(
                  onTap: () =>
                      MapsLauncher.launchCoordinates(35.711445, 51.400460),
                  child: SfMaps(layers: [
                    MapTileLayer(
                      controller: _mapTileLayerController,
                      urlTemplate:
                          'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                      initialZoomLevel: 13,
                      zoomPanBehavior: _zoomPanBehavior,
                      initialFocalLatLng: MapLatLng(35.711445, 51.400460),
                      initialMarkersCount: 1,
                      markerBuilder: (context, index) {
                        return MapMarker(
                          latitude: 35.711445,
                          longitude: 51.400460,
                          child: Icon(
                            Icons.location_on,
                            color: Colors.red,
                            size: 40,
                          ),
                        );
                      },
                    )
                  ]),
                ),
              )

              // const Center(
              //   child: Icon(Icons.map, color: Colors.teal, size: 40),
              // ),
              ),
        ],
      ),
    );
  }
}
