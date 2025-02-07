arr = [jpg = new JPEGSaveOptions, jpg = new JpgSaveOptions]
jpg.jpegQuality = 7, tif.byteOrder = ByteOrder.MACOS
tif.layers = !(tif.interleaveChannels = true)

for(i = 0; i < arr.length; i++) {
     if (i) aD.changeMode(ChangeMode.CMYK);
     (aD = activeDocument).saveAs(File(String(aD
     .fullName).slice(0, -3) + (i ? 'jpg' : 'jpg')), arr)
}

aD.close(SaveOptions.DONOTSAVECHANGES)
