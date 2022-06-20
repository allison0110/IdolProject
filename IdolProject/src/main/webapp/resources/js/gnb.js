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
    singer: "BoA The 10th Album",
    title: "BETTER",
    img: "https://smtown-cdn.smtown.com/upload/album/cbd37acaeac1419ba59ee02f4ea2994f_2022-05-16-09-02-31.jpg",
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
    singer: "태연 (TAEYEON)",
    title: "Weekend",
    img: "https://cdnimg.melon.co.kr/cm2/album/images/106/45/654/10645654_20210706155154_500.jpg?25112f5d01b0377eff75df038c9b0c9b/melon/resize/282/quality/80/optimize",
  },
  {
    singer: "BTS",
    title: "Butter",
    img: "https://cdnimg.melon.co.kr/cm2/album/images/106/12/483/10612483_20210521111412_500.jpg?1c2769f71815b15741622b61a75fb530/melon/resize/282/quality/80/optimize",
  },
  {
    singer: "f(x)",
    title: "The 4th Album <4 Walls>",
    img: "https://smtown-cdn.smtown.com/upload/old-data/old/album/images/000/010/202/10202.jpg",
  },
  {
    singer: "Red Velvet",
    title: "Feel My Rhythm",
    img: "https://blog.kakaocdn.net/dn/LRxS3/btrwAZ3RsJZ/GAITCTgusH7LFMFK1qXask/img.png",
  },
  {
    singer: "Red Velvet",
    title: "Feel My Rhythm",
    img: "https://blog.kakaocdn.net/dn/LRxS3/btrwAZ3RsJZ/GAITCTgusH7LFMFK1qXask/img.png",
  },
  {
    singer: "Red Velvet",
    title: "Feel My Rhythm",
    img: "https://blog.kakaocdn.net/dn/LRxS3/btrwAZ3RsJZ/GAITCTgusH7LFMFK1qXask/img.png",
  },
  {
    singer: "Red Velvet",
    title: "Feel My Rhythm",
    img: "https://blog.kakaocdn.net/dn/LRxS3/btrwAZ3RsJZ/GAITCTgusH7LFMFK1qXask/img.png",
  },
  {
    singer: "Red Velvet",
    title: "Feel My Rhythm",
    img: "https://blog.kakaocdn.net/dn/LRxS3/btrwAZ3RsJZ/GAITCTgusH7LFMFK1qXask/img.png",
  },
  {
    singer: "Red Velvet",
    title: "Feel My Rhythm",
    img: "https://blog.kakaocdn.net/dn/LRxS3/btrwAZ3RsJZ/GAITCTgusH7LFMFK1qXask/img.png",
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
