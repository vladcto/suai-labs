const _hideDuration = 200

$(document).ready(function () {
  $(".dropbtn").click(function () {
    $(".dropdown-content").hide(_hideDuration)
    $(this).next(".dropdown-content").show()
  })
})

$(document).click(function (event) {
  if (!$(event.target).closest(".dropdown").length) {
    $(".dropdown-content").hide(_hideDuration)
  }
})

$(document).ready(function () {
  let currentIndex = 0
  const items = $(".showcase-item")
  const itemCount = items.length
  const wrapper = $(".showcase-wrapper")

  function showItem(index) {
    wrapper.css("transform", `translateX(-${index * 33.3}%)`)
  }

  $(".showcase-btn-prev").click(function () {
    currentIndex = (currentIndex - 1 + itemCount) % itemCount
    showItem(currentIndex)
  })

  $(".showcase-btn-next").click(function () {
    currentIndex = (currentIndex + 1) % itemCount
    showItem(currentIndex)
  })

  showItem(currentIndex)
})
