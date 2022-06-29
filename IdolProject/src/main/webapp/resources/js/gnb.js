//   header active script
var activeLinks = document.querySelectorAll(".active-link");
var header = document.querySelector("#header");
var body = document.querySelector("body");
var menu = document.querySelector("#menu");

body.addEventListener("scroll", function(event){
	console.log("scroll");
	if(event.target.scrollTop > 30){
		header.classList.add("scroll");
	}else{
		header.classList.remove("scroll");
	}
});
	
/**
 * active 될 이전 box id
 * 다른 active-link에 mouseenter를 한 경우 보여주는 box를 구분하기 위해서
 */
var activeBoxId = null;

/**
 * .active-link 에 있는 active class를 모두 제거한다.
 * 모두 제거한뒤 mouseenter 된 target에 active를 다시 적용시켜서 bold 고정 처리
 */
function removeLinkClass() {
  activeLinks.forEach(function (activeLink) {
    activeLink.classList.remove("active");
  });
}

activeLinks.forEach(function (activeLink) {
  activeLink.addEventListener("mouseenter", function (ev) {
    removeLinkClass(); // active 초기화

    header.classList.add("active");
    ev.target.classList.add("active");

    var id = ev.target.id; // a.active-link의 id (self)

    if (activeBoxId === id) return; // 만약 이전 박스와 현재 박스가 같다면 return

    // 기존 active box를 제거하는 부분
    if (activeBoxId !== null && activeBoxId !== id) {
      var boxId = "#" + activeBoxId + "-box";
      var box = document.querySelector(boxId);

      box.classList.remove("active");
    }

    // 새로운 active box를 추가하는 부분
    activeBoxId = id;
    var boxId = "#" + id + "-box"; // #actist-box || #product-box
    var box = document.querySelector(boxId);
    box.classList.add("active");
  });
});

// menu 영역에서 벗어나면 header에 있는 active class를 제거한다.
header.addEventListener("mouseleave", function (ev) {
  removeLinkClass();
  header.classList.remove("active");
});

// artist 부분에서 오른쪽에 나오는 앨범데이터 정보

var albumList = [
  {
    singer: "SHINEE",
    title: "Don't Call Me",
    img: "https://w.namu.la/s/1b7f1c1234031f5789d5c5c690a5f7cce0078ed91f5b05f92933f0786a53584772de4e16a272484630e854e84f0a74d3482d3aa9f6a5f94c9e1d21f28e8e0f501d4b02a1c06dec48e182fd7f674997cd3bc9f8fbfa6bd870faf1557c02e2f484",
  },
  {
    singer: "싸이(PSY)",
    title: "That That (prod. & feat. SUGA of BTS)",
    img: "https://cdnimg.melon.co.kr/cm2/album/images/109/37/474/10937474_20220428225312_500.jpg?cbc115ca0a2db2fed082e94f5862e8bd/melon/resize/282/quality/80/optimize",
  },
  {
    singer: "(여자)아이들",
    title: "TOMBOY",
    img: "https://cdnimg.melon.co.kr/cm2/album/images/108/90/384/10890384_20220314111504_500.jpg?4b9dba7aeba43a4e0042eedb6b9865c1/melon/resize/282/quality/80/optimize",
  },
  {
    singer: "AESPA",
    title: "Girls",
    img: "./resources/upload/group/1655170280995AESPA_GROUP1.jpg",
  },
  {
    singer: "BTS",
    title: "Yet To Come",
    img: "https://w.namu.la/s/8e5afeb82cc93fedca172df95524ba8b615c05f49efea0e5089bee26cfa60ecdca4949060da4c6294e3698e61ae08a5b80681c61c258f46870a720268c818c43b9af0343834edd21e95e58d310e88155208b219eb194768a3f40c2945e7cd9d8",
  },
  {
    singer: "BLACK PINK",
    title: "How You Like That",
    img: "./resources/upload/group/1655183364336BLACKPINK_GROUP1.jpg",
  },
  {
    singer: "RED VELVET",
    title: "Feel My Rhythm",
    img: "https://blog.kakaocdn.net/dn/LRxS3/btrwAZ3RsJZ/GAITCTgusH7LFMFK1qXask/img.png",
  },
  {
    singer: "박재범(JAY PARK)",
    title: "GANADARA (Feat. 아이유)",
    img: "https://w.namu.la/s/92b0306c328a8ae5a76212ed9846dbf2a50ac1b7e9e0895e5294e9469755e28b67190f7bf901fff36c75ff57c2503550708d62ddd36c7a7ffabcd2849e1e9dc8d81bb083dbbdced44f281d16d5fc12bf3f70f1591e259d8279648db504d8b88ce419d4f92616a6beac86c2d769eb3a8d",
  },
  {
    singer: "STAYC",
    title: "RUN2U",
    img: "https://w.namu.la/s/c399267b13ecf57673b3d417574cb386e9290857a859fc6df4fee8fe2a281f293bd8d6167c38041b89962ff15d85b992abc9b155f936b5d34dfff30987d06017f7bb3e67894fe8afcfbff9ae501e6633e0a4963ab6ef9bd577d3ede8baa3eab521848a4ca6f22562e21e0da32cfaf6ed",
  },
  {
    singer: "BEAST",
    title: "DAYDREAM",
    img: "https://w.namu.la/s/06c104022fe972a6a0489bded09d166d4b7632bc87d433f418e4d42369fe5164a92c61ecf068f19c7feff64e6295df3b87e683bcfe6fb1747a82a4c20a521942521f3569a708b788084be96b63fa21ad0fcc2039cf31f89563323d94204750a368aa1d3ea11bcabd7e20f86a5cc43d2d",
  },
  {
    singer: "IVE",
    title: "LOVE DIVE",
    img: "https://w.namu.la/s/bf7e863174130b908c71d79fdda7f2e2d6e09b217fcd209d61730021a1af2d09bee7b2987a8148198604c7e47d768526e3213a529a6a37428caeb6214843c9d6ef79fa8580ab94c4a90941db13033e025f97b26e75daa22c5bd153c67ed24325ff39a703fe975082a8b2efa341a7a282",
  },
  {
    singer: "LE SSERAFIM",
    title: "FEARLESS",
    img: "https://w.namu.la/s/46e09f1a080006620dbf2e553b672677a3336dd37bf6238f7cab44e7a90ed061108b7b82ef45e2709df31f5eabacd2629c4adccc1e9b99741aee532767d1d3cd41826d610668b02d0aaf834cc84b59883dbe518fcf024cc2dcc73bd3a61325abc96a163b62a748dc84b9eb16773a29fe",
  },
];

var artistList = document.querySelectorAll(".artist-menu li a");
var img = document.querySelector("#img");
var title = document.querySelector("#title");
var singer = document.querySelector("#singer");

// artist index를 사용해서 앨범 리스트의 index를 가져와 데이터를 setInfodp 넘겨준다.
artistList.forEach(function (artist, i) {
  artist.addEventListener("mouseenter", function () {
    var data = albumList[i];
    setInfo(data);
  });
});

// set 데이터 함수
function setInfo(data) {
  img.src = data.img;
  title.innerHTML = data.title;
  singer.innerHTML = data.singer;
}

// 최초 1번 랜더링
setInfo(albumList[0]);