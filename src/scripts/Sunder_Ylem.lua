--- Sunder Ylem.
-- @module Ylem

snd.ylem_loaded = true

--- ylm namespace.
-- @table ylm
ylm = ylm or {}

ylm.active = false
ylm.next_zone = "none"
ylm.foci = 0

--- Path to walk for finding foci.
-- @table ylm.path
ylm.path = {

  v1680 = "20389",
  v20389 = "13253",
  v13253 = "60762",
  v60762 = "26690",
  v26690 = "26668",
  v26668 = "10041",
  v10041 = "35117",
  v35117 = "26920",
  v26920 = "35217",
  v35217 = "60845",
  v60845 = "46341",
  v46341 = "32704",
  v32704 = "45483",
  v45483 = "14729",
  v14729 = "1644",
  v1644 = "56942",
  v56942 = "1602",
  v1602 = "19344",
  v19344 = "62798",
  v62798 = "1433",
  v1433 = "3018",
  v3018 = "16438",
  v16438 = "36865",
  v36865 = "6",
  v6 = "32237",
  v32237 = "26841",
  v26841 = "38090",
  v38090 = "26994",
  v26994 = "11326",
  v11326 = "11311",
  v11311 = "76497",
  v76497 = "77437",
  v77437 = "25738",
  v25738 = "19602",
  v19602 = "3430",
  v3430 = "5598",
  v5598 = "32908",
  v32908 = "23899",
  v23899 = "5692",
  v5692 = "21001",
  v21001 = "59979",
  v59979 = "19323",
  v19323 = "42831",
  v42831 = "768",
  v768 = "973",
  v973 = "71926",
  v71926 = "19810",
  v19810 = "71554",
  v71554 = "31552",
  v31552 = "19987",
  v19987 = "9510",
  v9510 = "19576",
  v19576 = "64288",
  v64288 = "55101",
  v55101 = "17034",
  v17034 = "62996",
  v62996 = "73508",
  v73508 = "4163",
  v4163 = "3276",
  v3276 = "63351",
  v63351 = "20932",
  v20932 = "20281",
  v20281 = "71815",
  v71815 = "15820",
  v15820 = "70916",
  v70916 = "21908",
  v21908 = "51157",
  v51157 = "62383",
  v62383 = "18082",
  v18082 = "25969",
  v25969 = "44816",
  v44816 = "18601",
  v18601 = "22477",
  v22477 = "4078",
  v4078 = "8854",
  v8854 = "18467",
  v18467 = "63763",
  v63763 = "14439",
  v14439 = "63730",
  v63730 = "20855",
  v20855 = "8795",
  v8795 = "61323",
  v61323 = "58675",
  v58675 = "54699",
  v54699 = "13425",
  v13425 = "59187",
  v59187 = "22824",
  v22824 = "23791",
  v23791 = "23140",
  v23140 = "22702",
  v22702 = "58704",
  v58704 = "16282",
  v16282 = "72008",
  v72008 = "47147",
  v47147 = "1288",
  v1288 = "63306",
  v63306 = "56648",
  v56648 = "4740",
  v4740 = "4808",
  v4808 = "65189",
  v65189 = "49749",
  v49749 = "64608",
  v64608 = "64478",
  v64478 = "64396",
  v64396 = "11794",
  v11794 = "60181",
  v60181 = "11860",
  v11860 = "74377",
  v74377 = "36271",
  v36271 = "1012",
  v1012 = "3496",
  v3496 = "71074",
  v71074 = "58789",
  v58789 = "17612",
  v17612 = "62102",
  v62102 = "276",
  v276 = "16426",
  v16426 = "10812",
  v10812 = "34760",
  v34760 = "72513",
  v72513 = "1000",
  v1000 = "1774",
  v1774 = "3106",
  v3106 = "11634",
  v11634 = "11988",
  v11988 = "11994",
  v11994 = "56435",
  v56435 = "25408",
  v25408 = "59862",
  v59862 = "18439",
  v18439 = "11412",
  v11412 = "19854",
  v19854 = "31576",
  v31576 = "55276",
  v55276 = "58912",
  v58912 = "20835",
  v20835 = "21286",
  v21286 = "23202",
  v23202 = "73619",
  v73619 = "77434",
  v77434 = "57559",
  v57559 = "4964",
  v4964 = "2036",
  v2036 = "38894",
  v38894 = "16274",
  v16274 = "18415",
  v18415 = "19320",
  v19320 = "24548",
  v24548 = "5028",
  v5028 = "3887",
  v3887 = "57334",
  v57334 = "9853",
  v9853 = "59609",
  v59609 = "53230",
  v53230 = "10086",
  v10086 = "16584",
  v16584 = "16706",
  v16706 = "17069",
  v17069 = "60726",
  v60726 = "15344",
  v15344 = "city"

}
