# Virtual Tourist
The Virtual Tourist app allows users to travel the world without moving an inch from their home. It allows users to view the map of the world and drop pins wherever they wish to see photos that were taken in the location of the dropped pin via Flickr.

## Why This Project?
The project requires to persist a complex model using Core Data, and plist persistence of an array of dictionaries - core skills required of any iOS Developer.

## What did I learn?
- Use URLSessions to interact with a public restful API
- Create a user interface that intuitively communicates network activity and download progress
- Store media on the device file system Use Core Data for local persistence of an object structure


# Application Scenes
- **Virtual Tourist View**: Allows users to view the map of the world and drop pins wherever the wish.
- **Photo Album View**: Allows users to view photos that were taken in the dropped pin.

These two scenes are described in details below:

## Travel Locations Map
- When the app first starts, it will open to the map view. Users will be able to zoom and scroll around the map using standard pinch and drag gestures.
- The center of the map and the zoom level should be persistent. If the app is turned off, the map should return to the same state when it is turned on again.
- Tapping and holding the map drops a new pin. Users can place any number of pins on the map.
- When a pin is tapped, the app will navigate to the Photo Album view associated with the pin.

<img src="https://lh3.googleusercontent.com/wFsA4jKzvfS8hSdPm-bus7fE1xn5tGCoNcMY63XZMi-TJOvGSEhRGxJL8wjxVvvmZtNQVJp4LOMgYthgsE5XaLpgSS7PfeckN6xyvn31jGqpIbMRXe4b_xhpBsDS5wy2Coe77WeAAAbYVHzZC7aipyRSgVTmgcJ9W4xzlQcAadFkKE53SynMEs7xY1rJrbr_5-HQhUca7RIQZts-dCiDF1U_KaWQQZnYergHaeWQeLVlGmkkLxyajIgeCBZ2tey6WUhWlnDHNa3rlasNAPWTTtaqS7en3b4l507GbvUGdWiUvTL--dfyDgpEkCIweWgFDCYoPZyl0GdFf24n61rOFIuMIGgKoqsX721tCSV2qq6WGwMxXljKa6MXG8vHdn4k1iGk8bwUlhIT2KXYlMZAmIRuO7Wsdd5sLVitRTQqQ0edmzPGiei6quUb4GQOK-snaGDvVyx9-T00cldQPRb1Adq3HnK9FH9iSjrFnP1XmbAB7uCpg5222g4E9diZFIRWV8wrUTdztPXQPcl-j9pJZmYW0nqVA4xOISy4f-WbbunQU3lFnf2rjw7yJa_T6oHg3_H9Y0Wyzi_RvhhMcoBksqSGG09qSgqXF5d_NvW_WJzMk-JpvFXgmRYDXvrbs9W4B391IKcTCPvt8QSQEKgOEhW2QrGjBv2Wcy2JWw4kvEZNwsKwt0JpzMmPzQt5JJmOjIBh2LiLszpW7Ycau-a1KMU=w558-h1116-no" width="200" height="360" />


## Photo Album
- If the user taps a pin that does not yet have a photo album, the app will download Flickr images associated with the latitude and longitude of the pin.
- If no images are found a “No photos found” label will be displayed.
- If there are images, then they will be displayed in a collection view.
- The app should determine how many images are available for the pin location, and display a placeholder image for each.

<img src="https://lh3.googleusercontent.com/lW0Qle4MbQDhhh_K0VUdCDzpJisd5ozeNLKz21dFG3LkhvsFcw9MF9OGu_C-0FdJtmtbFm0V291jNR8cx7OoMIB4dIIpgBepdP2-gErJV3En3Es26SJ7HJjE3unY-OZXqFqdBRu-6H0tyVLt8XvwdWkdRCHPofgb_EhJUdYkdyEulZV6QfJx9qf63-wSeWCvfyMCzf4K_HTJ4lPBbHB7pVMgIVsqKY7LCYO1oDMt831uT3SwlCZVQeBFJCQmdAB7iNe_4E_esgMtjKAQzE5dhReH0sn110uJ1tTjmQ451stxUWa9Mu_EIP9OXlCogHGL_7bqCz1qkOG9V3W40D_6_nYGn5zlzvL8ZHo5R-KiDxKF6Bqt0BvtddL0CqjCuXO6-XQafh4FGb3Y31xfC8ZJg_87AlaQTlD1pEdD_TufA3Li4TDaUl-lLIa-kQlWDyH2LdJ_uDsvm9Y5WReSvojjrRTVoPQJ2WCTejiqRXwGteN8PLfzkc2IdmN9lBjvnkmuQ0ug4W3yng-eJI4tswc8dkos_qswmwlEtDTWWalgrfd7iO2bGqt2-2FInmkxjsLxeTjleEFiwOBpyIYSp07hZa_A4Pczejx1pMHJKrmjMKUiutCBaILe2EOeYWOdvBB7RROLWGUBhigTT-DMbRJkY6MOC8s5hG4=w562-h1156-no" width="200" height="360" />


- Tapping **New Collection** button should empty the photo album and fetch a new set of images. Note that in locations that have a fairly static set of Flickr images, “new” images might overlap with previous collections of images.
- Users should be able to remove photos from an album by tapping them. Pictures will flow up to fill the space vacated by the removed photo.
- All changes to the photo album should be automatically made persistent.
- Tapping the back button should return the user to the Map view.

<img src="https://lh3.googleusercontent.com/c3DS_NEsj01t2xf32W4yAxfbiAowwg5lz2-0bVWFQTS2FkODuf91xeKWWh2DiJQLm3xWQWJRDnnp86SC3MMD63GPdc7Nl6_mTX9XDIebZNODygUsi6TTZSuSmgkHGvhD-by1mley83FXKEyM_SrhBkvhzgKo-GssaMPXNHR6SaTxxrWufmYFRWOz2CTHP8df3yJy85H46Lgu1IO_TzIWtZ9eIa-3rcBWLVh-GZE1Z9T6tdEat_lJeVyauwYkLsI3XMne3iZg5H0paIQy38EAVsEfUF8S5FUusSPfAwtDPMJiYqc1gPt7kklqqOM97O8LCT1qsgfd9QfoQw7Mz1i3EpgMDfq69_fO4wxuPn4SbK47qb8x6xHt23xKRmZNKINB-0pbsZZ6tTs8lGS1briUWxlAWjIl9VdHv969Ue_v532oURz7fYE1gH2WDwQG03QZKYaRodOgy-p6hNZvmYicO_vuTevCJyQB9vCbEaMo65ZLqivuHOXvCjUHTt68XNPUZl_LZa2JzhF14zXPjHCvpa2aWyEwC9Jo4G9cm1tutvP02Hz-_cRMHHfH1ZFjQNL85k-6VUat7eqEqaHNhDbzkX1oLIuDWgfxqGTquGKfpDgYq2-G8dp2sU6mvwX6NIxWW4jcBzvAg5afcB0axZ7Z9K3Oxq0v1z4=w552-h1160-no" width="200" height="360" />


- If the user selects a pin that already has a photo album then the Photo Album view should display the album.
