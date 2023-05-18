'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"version.json": "bf7bc650a9b1a4ae8510763f1acdd75c",
"splash/img/light-2x.png": "a6ee36c20f580ac89b8edd1bcf384fa0",
"splash/img/dark-4x.png": "61e19038840acc28e8260a5b00b12c29",
"splash/img/light-3x.png": "1a1dc921d7a875285650153e87035304",
"splash/img/dark-3x.png": "1a1dc921d7a875285650153e87035304",
"splash/img/light-4x.png": "61e19038840acc28e8260a5b00b12c29",
"splash/img/dark-2x.png": "a6ee36c20f580ac89b8edd1bcf384fa0",
"splash/img/dark-1x.png": "ad009cce9088dd1ecdf848fabbdbe9ab",
"splash/img/light-1x.png": "ad009cce9088dd1ecdf848fabbdbe9ab",
"splash/splash.js": "123c400b58bea74c1305ca3ac966748d",
"splash/style.css": "1404a5cdf67c618f89467983c828bd26",
"index.html": "ce8c6d14a1f9d6d98fe7bbfcbdb460df",
"/": "ce8c6d14a1f9d6d98fe7bbfcbdb460df",
"main.dart.js": "15f1ab9be931d1f90d185a419eec1287",
"flutter.js": "6fef97aeca90b426343ba6c5c9dc5d4a",
"favicon.png": "140abc41beb3583a2a380f438025c0e8",
"icons/Icon-192.png": "8849887a8eae50e5e7879fc11d12447b",
"icons/Icon-maskable-192.png": "8849887a8eae50e5e7879fc11d12447b",
"icons/Icon-maskable-512.png": "1681b0b3a2a1d4ad2a35e888a70ad12a",
"icons/Icon-512.png": "1681b0b3a2a1d4ad2a35e888a70ad12a",
"manifest.json": "550df1aad23099dcd40161fc06781ceb",
"assets/AssetManifest.json": "9d0101fe24864d74b04bb62a96459391",
"assets/NOTICES": "487bc8577a8d4a501552f85b05835322",
"assets/FontManifest.json": "bf334e800811fcb15866cc2b021eefc8",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "57d849d738900cfd590e9adc7e208250",
"assets/shaders/ink_sparkle.frag": "f8b80e740d33eb157090be4e995febdf",
"assets/AssetManifest.bin": "71f7db7c6c9b67377202458700f8ebb7",
"assets/fonts/MaterialIcons-Regular.otf": "62ec8220af1fb03e1c20cfa38781e17e",
"assets/assets/lyrics/treasure_ep_map_to_answer/better.json": "9c49416fe9cc8ba46f7a51dc35419708",
"assets/assets/lyrics/treasure_ep_map_to_answer/declaration.json": "50416166e3b953df42846175961e11d0",
"assets/assets/lyrics/treasure_ep_map_to_answer/sunrise_atmospheric_mix_by_spacecowboy.json": "676fc91df5f4f4a03a39c61ed479724d",
"assets/assets/lyrics/treasure_ep_map_to_answer/star_1117_buddys_melodic_mix.json": "088cc9d9f095849ca6d91a6349fec764",
"assets/assets/lyrics/treasure_ep_map_to_answer/answer_japanese_ver.json": "46ad2116d38fc033e289703d848607e4",
"assets/assets/lyrics/treasure_ep_map_to_answer/wonderland_sean_ohs_skrt_mix.json": "8b59edcf639709b5c30a0c4a5f9310a1",
"assets/assets/lyrics/limitless/limitless_instrumental.json": "09e0c38f2e92e1a9c354c4fd5b0c6cf8",
"assets/assets/lyrics/limitless/diamond_instrumental.json": "56cea89c08fae834e63deead4657fe7c",
"assets/assets/lyrics/limitless/diamond.json": "365c9ddbf25c9e4027a19706108222a5",
"assets/assets/lyrics/limitless/limitless.json": "d4e3b9d173dbf5450497b96b9460656f",
"assets/assets/lyrics/treasure_ep_extra_shift_the_map/twilight_classic_buddy_mix.json": "013e127f2019857639a300afee91a107",
"assets/assets/lyrics/treasure_ep_extra_shift_the_map/utopia_japanese_ver.json": "8f1d2fb61b02a3ae617b1f01aeb9d089",
"assets/assets/lyrics/treasure_ep_extra_shift_the_map/aurora_japanese_ver.json": "10d640707e77e0eb3f96e3d92a44362c",
"assets/assets/lyrics/treasure_ep_extra_shift_the_map/hala_hala_traditional_treatment_mix.json": "661189e609092a0a9790e07bbd9b7001",
"assets/assets/lyrics/treasure_ep_extra_shift_the_map/hearts_awakened_live_alive_expression_revisited.json": "814bc494ee9c02307fd4d40b3959d548",
"assets/assets/lyrics/treasure_ep_extra_shift_the_map/say_my_name_flavor_of_latin_with_juwon_park.json": "910620f4dc84c460956473420ae8bbed",
"assets/assets/lyrics/treasure_ep_extra_shift_the_map/wave_ollounders_bold_dynamics_mix.json": "19890013255f6f7c2133e8c79f798e4d",
"assets/assets/lyrics/treasure_ep_extra_shift_the_map/illusion_chillin_with_buddy_mix.json": "bcbb7126ec7fdaf884bb53e77aafab32",
"assets/assets/lyrics/treasure_ep_extra_shift_the_map/treasure_smoothing_harmonies_mix.json": "41906a04b432978c10e2ecc54f88bde5",
"assets/assets/lyrics/treasure_ep_extra_shift_the_map/pirate_king_overload_mix.json": "7f9592ffb8cb50505f41cea95a7ff37d",
"assets/assets/lyrics/treasure_ep_extra_shift_the_map/promise_notation_from_senor_juwon_park.json": "33ece99d5d0dec6393317ea750931f88",
"assets/assets/lyrics/treasure_ep_fin/if_without_you.json": "361f0a94498267740ca698f6dd891aff",
"assets/assets/lyrics/treasure_ep_fin/precious_overture.json": "b182f48d02fe7f31faf99377c7236e3a",
"assets/assets/lyrics/treasure_ep_fin/with_u.json": "3c58f19d3d154f39b0368ef869082293",
"assets/assets/lyrics/treasure_ep_fin/thank_u.json": "8a886a921b54954d7728f8c9f2a616c5",
"assets/assets/lyrics/treasure_ep_fin/end_of_the_beginning.json": "a69ab55ec6886f1d6bc99f0b17dfa4f2",
"assets/assets/lyrics/treasure_ep_fin/win.json": "67c307555d3b04d55abb16f63ed1ca36",
"assets/assets/lyrics/treasure_ep_fin/sunrise.json": "8e696347fc86366719d9d21b85c1b4a0",
"assets/assets/lyrics/treasure_ep_fin/mist.json": "f996aaebc070f72637b8848552b9b10f",
"assets/assets/lyrics/treasure_ep_fin/wonderland.json": "2568f63e3579d2c0c718813615daf101",
"assets/assets/lyrics/treasure_ep_fin/dazzling_light.json": "71a8439ab15f53e1408a0b573d27a3fa",
"assets/assets/lyrics/treasure_ep_fin/beginning_of_the_end.json": "b6204b21da36c751ee1fcba63f416cf2",
"assets/assets/lyrics/fever_pt_1/to_the_beat.json": "48e7042712eb7da66809dec50ba240d0",
"assets/assets/lyrics/fever_pt_1/one_day_at_a_time.json": "ede2af897717d83d2b98d9b6748f9287",
"assets/assets/lyrics/fever_pt_1/fever.json": "c4a2ed4d6a63bb7f6fbcb93427300808",
"assets/assets/lyrics/fever_pt_1/inception.json": "5c1246e6f39a044b291c98510a35ab97",
"assets/assets/lyrics/fever_pt_1/dear_diary.json": "0268304613365c0681eb7d5e54f3157c",
"assets/assets/lyrics/fever_pt_1/good_lil_boy.json": "4e661809795b933b812a95c807f1dd57",
"assets/assets/lyrics/fever_pt_1/thanxx.json": "76cb75a3cd0edf19276e6375e9e3188b",
"assets/assets/lyrics/treasure_ep_1/my_way.json": "397600cbd4e37d74044484ab1e54dc81",
"assets/assets/lyrics/treasure_ep_1/pirate_king.json": "a06c2716e8fe742ee8a42b4f8d990407",
"assets/assets/lyrics/treasure_ep_1/stay.json": "091de9d5cbaca0c422d2c6d1c96664ef",
"assets/assets/lyrics/treasure_ep_1/treasure.json": "e5608f981d1479e4362853a0522db0f1",
"assets/assets/lyrics/treasure_ep_1/intro_long_journey.json": "fa87a209a230f193530bf6b15dc34bed",
"assets/assets/lyrics/treasure_ep_1/twilight.json": "d3f7365e32da254cbb28508e32707f90",
"assets/assets/lyrics/dreamers/dreamers_instrumental.json": "60ccd8046e241bee8751fc3ac02b918d",
"assets/assets/lyrics/dreamers/still_here_acoustic_ver.json": "bf1a97bcd1d6cc1fabd72ce79ae65a12",
"assets/assets/lyrics/dreamers/blue_summer.json": "95c9ef122c4fd2d0c09ba8029fd5a623",
"assets/assets/lyrics/dreamers/dreamers.json": "4ef207507addb55d8154fcab7110dd9e",
"assets/assets/lyrics/beyond_zero/intro_beyond_zero.json": "dd853407825696f465de01b19d277bd0",
"assets/assets/lyrics/beyond_zero/the_king.json": "98515b1b7ca6fecad3b94e6fac92cb21",
"assets/assets/lyrics/beyond_zero/yakanhikou_turbulence_japanese_ver.json": "d08b8a0ebb5496f408af678d64cae8f4",
"assets/assets/lyrics/beyond_zero/take_me_home_japanese_ver.json": "c050cf3922e56bb63d217a2c4b140ff9",
"assets/assets/lyrics/beyond_zero/rocky_boxers_ver.json": "7cf6b992c94d4b0daf9f11ec334509a3",
"assets/assets/lyrics/beyond_zero/fireworks_im_the_one_japanese_ver.json": "5add86db632d8858b24733a19368fd29",
"assets/assets/lyrics/beyond_zero/deja_vu_japanese_ver.json": "52b2aff3ad2e26a5d1a8ade85f56fab5",
"assets/assets/lyrics/spin_off_from_the_witness/halazia.json": "daaec0e58203867b92cee8dd04d413a1",
"assets/assets/lyrics/spin_off_from_the_witness/win_june_one_remix.json": "87a7277ee3187d6b8254d50c4a6ebf35",
"assets/assets/lyrics/spin_off_from_the_witness/outro_blue_bird.json": "7f397970a7fee7e3eb5dfb2fa2a4fb1d",
"assets/assets/lyrics/spin_off_from_the_witness/im_the_one_edenary_remix.json": "8c3d5a31b4a9b1cc8a75dd92e00745e2",
"assets/assets/lyrics/spin_off_from_the_witness/take_me_home_idiotape_remix.json": "a7038a7712988e4851955226689750e5",
"assets/assets/lyrics/into_the_a_to_z/better.json": "9c49416fe9cc8ba46f7a51dc35419708",
"assets/assets/lyrics/into_the_a_to_z/pirate_king_japanese_ver.json": "6ac59668375be20b53131007bc364939",
"assets/assets/lyrics/into_the_a_to_z/utopia_japanese_ver.json": "8f1d2fb61b02a3ae617b1f01aeb9d089",
"assets/assets/lyrics/into_the_a_to_z/aurora_japanese_ver.json": "10d640707e77e0eb3f96e3d92a44362c",
"assets/assets/lyrics/into_the_a_to_z/wonderland_japanese_ver.json": "6e00fca61be171a92512659dcefc6a20",
"assets/assets/lyrics/into_the_a_to_z/thanxx_japanese_ver.json": "b9ec42f5543af67ec13d1062d75e7d3e",
"assets/assets/lyrics/into_the_a_to_z/answer_japanese_ver.json": "46ad2116d38fc033e289703d848607e4",
"assets/assets/lyrics/into_the_a_to_z/say_my_name_japanese_ver.json": "bea74f00c038a3c0b2dcaa664846557e",
"assets/assets/lyrics/into_the_a_to_z/inception_japanese_ver.json": "4aee0a0abb072c1147c0e6024e0f87ca",
"assets/assets/lyrics/into_the_a_to_z/still_here.json": "6754f32f7898f75ca6c32deeb1dd9e3a",
"assets/assets/lyrics/the_world_ep_paradigm/guerrilla_flag_ver.json": "6eee1c54d2b49ce82defc07ad549f345",
"assets/assets/lyrics/the_world_ep_paradigm/cyberpunk_japanese_ver.json": "573ce36ba59b1e70d7dd5e0849492a38",
"assets/assets/lyrics/the_world_ep_paradigm/new_world_japanese_ver.json": "f76774080e258466580575ef23e46922",
"assets/assets/lyrics/the_world_ep_paradigm/intro_siren.json": "970e41fe48c354e5b7bec3d92da3b3e6",
"assets/assets/lyrics/the_world_ep_paradigm/outro_liberty.json": "c1954c58189f878d9d55a573b212c4bd",
"assets/assets/lyrics/the_world_ep_paradigm/paradigm.json": "a37bdce47b2d366ef65944ce16d92444",
"assets/assets/lyrics/fever_epilogue/turbulence.json": "01ee27be5359a20e95ae6eb21ec328e6",
"assets/assets/lyrics/fever_epilogue/wonderland_symphony_no_9_from_the_wonderland.json": "95417241036385fbd7aa9882e83363d1",
"assets/assets/lyrics/fever_epilogue/the_real.json": "7025846e853f5337bbb747ba5c8a4bd7",
"assets/assets/lyrics/fever_epilogue/the_letter.json": "a78f00df92d678ea3a2c563b82dfe34e",
"assets/assets/lyrics/fever_epilogue/better_korean_ver.json": "a7509e3c2b560c7f08bce0a1f5f5baf6",
"assets/assets/lyrics/fever_epilogue/be_with_you.json": "4d7139e922df07a926a6acb70f5f14ac",
"assets/assets/lyrics/fever_epilogue/outro_over_the_horizon.json": "96168aa4871ca666504b7df6c50ff9f7",
"assets/assets/lyrics/fever_epilogue/answer_ode_to_joy_feat_la_poem.json": "0e0ecd0238a5ccf4f16213956f97fbda",
"assets/assets/lyrics/fever_epilogue/still_here_korean_ver.json": "4b4aac1693fd51a47ff71be0d1ad1973",
"assets/assets/lyrics/fever_epilogue/wave_overture.json": "ed3f638a78b04a32de962f868d6138ce",
"assets/assets/lyrics/treasure_epilogue/horizon.json": "8b8ab5d28c5419507d972a6f514137c7",
"assets/assets/lyrics/treasure_epilogue/long_journey_outro.json": "6aa13ba319e5179a1ffee4d4f4c644cc",
"assets/assets/lyrics/treasure_epilogue/star_1117.json": "c1ba2d548940f739f342b08fac0b6fac",
"assets/assets/lyrics/treasure_epilogue/precious.json": "aafaa24b704d706de366d2b5883deb85",
"assets/assets/lyrics/treasure_epilogue/answer.json": "5c08ed00238ea5833ee24f51d6976558",
"assets/assets/lyrics/treasure_ep_2/from.json": "b55574202844092df40df8136a42251a",
"assets/assets/lyrics/treasure_ep_2/desire.json": "f06be32c816b1cbbe9cd5b2f9b086b7d",
"assets/assets/lyrics/treasure_ep_2/light.json": "e388c992f65ab6fbe136e98467fa3086",
"assets/assets/lyrics/treasure_ep_2/promise.json": "c11482e0187d8cd0b65c2847ff70623a",
"assets/assets/lyrics/treasure_ep_2/say_my_name.json": "9ba76b21bdb988e0aaf03f1f4dc71d2b",
"assets/assets/lyrics/treasure_ep_2/hala_hala_hearts_awakened_live_alive.json": "e47fe45324eb33be08b8ef673448c18c",
"assets/assets/lyrics/fever_pt_2/take_me_home_english_ver.json": "332c64321c66dcc46299fb8fa7ea863d",
"assets/assets/lyrics/fever_pt_2/time_of_love.json": "d0b011dd5de80c8f2e0c78c3314802c9",
"assets/assets/lyrics/fever_pt_2/fireworks_im_the_one.json": "d49687562c4526c8021538bec1b5cd9e",
"assets/assets/lyrics/fever_pt_2/celebrate.json": "e5a8f31bd7384cefe2b46cc2f8ba0793",
"assets/assets/lyrics/fever_pt_2/take_me_home.json": "04b8aaab528c2eb2401734e86fe1af36",
"assets/assets/lyrics/fever_pt_2/im_the_one_heat_topping_ver.json": "2f3d0bca04ed65abf3fda6d3076c2f9a",
"assets/assets/lyrics/fever_pt_2/the_leaders.json": "34d7adaf40e7e70fcf43d48b72d8e278",
"assets/assets/lyrics/treasure_ep_3/utopia.json": "ec0259c6c73f5a3f304c7f2fbf195842",
"assets/assets/lyrics/treasure_ep_3/crescent.json": "34f237da83fed48c4249f53c29898335",
"assets/assets/lyrics/treasure_ep_3/dancing_like_butterfly_wings.json": "1b686bda8dc7861ebf805e1c22a1e89c",
"assets/assets/lyrics/treasure_ep_3/aurora.json": "6c1c3af50f4a636daa1f6b3012bee350",
"assets/assets/lyrics/treasure_ep_3/wave.json": "32bbeb470863aab42608c4ace177050b",
"assets/assets/lyrics/treasure_ep_3/illusion.json": "ce7ca2001999152ec24c40a3e9586ba7",
"assets/assets/lyrics/fever_pt_3/not_too_late.json": "de789f333bcf65013a0317d6c5560389",
"assets/assets/lyrics/fever_pt_3/rocky.json": "260f9052a69cde0b6cb40b1c896875ff",
"assets/assets/lyrics/fever_pt_3/feeling_like_i_do.json": "547d1fcca967841999029641b9204f4d",
"assets/assets/lyrics/fever_pt_3/eternal_sunshine.json": "6227d4fe1adf9c2723471e596822a76b",
"assets/assets/lyrics/fever_pt_3/all_about_you.json": "590785341056af5a07f001546f8f64a7",
"assets/assets/lyrics/fever_pt_3/deja_vu.json": "735d2dc20469b5b2ba534af587fdf646",
"assets/assets/lyrics/the_world_ep_1_movement/cyberpunk.json": "20bae89b249297f2c3a781540559f1ce",
"assets/assets/lyrics/the_world_ep_1_movement/propaganda.json": "c739a88284cecf5287ef351b8a13a2a1",
"assets/assets/lyrics/the_world_ep_1_movement/guerrilla.json": "cd99c2369f9fe047e4451a451c6685ae",
"assets/assets/lyrics/the_world_ep_1_movement/sector_1.json": "d3265cf70b3424dda768576dad2b5cba",
"assets/assets/lyrics/the_world_ep_1_movement/new_world.json": "1b82beb30ec5ea97796c66d30d4c66a2",
"assets/assets/lyrics/the_world_ep_1_movement/wdig_where_do_i_go.json": "878ad8bd699a7748949962491421597e",
"assets/assets/lyrics/the_world_ep_1_movement/the_ring.json": "f1c38e2894eedca2f3d9dc6fb9a5ae95",
"assets/assets/images/misc/presplash.png": "5ce4f80c9859092b01da20d41dc3f8eb",
"assets/assets/images/misc/ateez_group.jpg": "a4870ce2b81f369a3b3ddd92df46834d",
"assets/assets/images/misc/ateez_group_1.jpg": "82b49cbdcf3adef910854000b70284aa",
"assets/assets/images/misc/ateez_group_2.jpg": "9488b59f3c93859d4f1a1293026d42af",
"assets/assets/images/misc/splash.png": "9e29aab8bbb718f4535a4f8d67f877c7",
"assets/assets/images/misc/ateez_logo.png": "5515f004e88cf667f36eb604650c0897",
"assets/assets/images/cover_art/dreamers.jpg": "c02d16a80faee2921fdc0fe007f7cabb",
"assets/assets/images/cover_art/the_world_ep_paradigm.jpg": "841322028956d708e3251a10f8d13cb9",
"assets/assets/images/cover_art/limitless.jpg": "985e61450e80aad01305332c8c84e43e",
"assets/assets/images/cover_art/spin_off_from_the_witness.jpg": "8afd543178e6645ce7b1cfa1e4d914d3",
"assets/assets/images/cover_art/treasure_ep_3.jpg": "d80b985fe85b8ed1650cba257dcc1a65",
"assets/assets/images/cover_art/into_the_a_to_z.jpg": "a6841afcf39f7056f275fc5a1cd52e6c",
"assets/assets/images/cover_art/treasure_ep_2.jpg": "1e4935888bc53344e9f982f7476f890f",
"assets/assets/images/cover_art/beyond_zero.jpg": "1cd6d6aa5cd3717128d73137eaf4631f",
"assets/assets/images/cover_art/treasure_ep_1.jpg": "c44384bb343f569d237bc2c009658f7d",
"assets/assets/images/cover_art/fever_epilogue.jpg": "82376ee98eafe5fb6de9b905a040ee54",
"assets/assets/images/cover_art/treasure_ep_extra_shift_the_map.jpg": "3772f03400b1176d515c6ad56134e923",
"assets/assets/images/cover_art/treasure_ep_fin.jpg": "d03b4fd08c98fcd6ce7f0d3a1150a483",
"assets/assets/images/cover_art/treasure_ep_map_to_answer.jpg": "23eddc26158f6d44c6fdc247b9dc0b15",
"assets/assets/images/cover_art/fever_pt_3.jpg": "c5d0d4112fbbd34e8c10001f1af1a6e4",
"assets/assets/images/cover_art/fever_pt_2.jpg": "18ace79ac4dd0e7e6201b7cde9ae9498",
"assets/assets/images/cover_art/the_world_ep_1_movement.jpg": "9277f2e93b3ccb081c1dbf370dfedb1d",
"assets/assets/images/cover_art/fever_pt_1.jpg": "6240698af6cd657a59ff06628543884d",
"assets/assets/images/cover_art/treasure_epilogue.jpg": "d163ee806c15197b3d35f63303c42129",
"assets/assets/fonts/Raleway-Regular.ttf": "75b4247fdd3b97d0e3b8e07b115673c2",
"assets/assets/fonts/Raleway-Black.ttf": "38b405eba92acbb5aef45d8152f2a736",
"assets/assets/fonts/Raleway-BlackItalic.ttf": "82163a0f87990e4f9d9ec2b7893e796a",
"assets/assets/fonts/Raleway-Italic.ttf": "f73026bcd64e5a5265ab616e5083cd48",
"canvaskit/skwasm.js": "1df4d741f441fa1a4d10530ced463ef8",
"canvaskit/skwasm.wasm": "6711032e17bf49924b2b001cef0d3ea3",
"canvaskit/chromium/canvaskit.js": "8c8392ce4a4364cbb240aa09b5652e05",
"canvaskit/chromium/canvaskit.wasm": "fc18c3010856029414b70cae1afc5cd9",
"canvaskit/canvaskit.js": "76f7d822f42397160c5dfc69cbc9b2de",
"canvaskit/canvaskit.wasm": "f48eaf57cada79163ec6dec7929486ea",
"canvaskit/skwasm.worker.js": "19659053a277272607529ef87acf9d8a"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
