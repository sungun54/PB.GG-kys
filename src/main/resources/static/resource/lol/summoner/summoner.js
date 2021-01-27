/*

$(function () {
    $.OP.GG.common.GNBAutoComplete.init();

    $('.gnb-btn-dropdown').click(function () {
        var dropdownButton = $(this),
            dropdownItem = dropdownButton.closest('.gnb-list-item-dropdown');

        dropdownItem.toggleClass('gnb-list-item-dropdown--acitve');

        $(document).on('click', function (event) {
            var target = event.target || event.srcElement;
            var $target = $(target);

            if (!$target.closest('.gnb-list-item-dropdown').length) {
                dropdownItem.removeClass('gnb-list-item-dropdown--acitve');
            }
        });
    });

    $('.gnb-btn-setting').on('click', function () {
        if (typeof fbq == 'function') {
            $.OP.GG.tracker.combine.sendEvent([
                'FB', 'Pixel'
            ], 'Index', 'ShowChangeRegion', {Referral: 'GNB'});
        }
    });
    $('.site a').on('click', function (evt) {
        var $site = $(evt.target).closest('.site');
        $.OP.GG.tracker.combine.sendEvent([
            'FB', 'Pixel'
        ], 'Index', 'ClickGlobalMenu', {MenuType: $site.data('site')});
    });
})

$(function() {
	var searchInputPast = null;
	var searchTextInput = $(".SearchTeamInput > .Input");

	var allTeams = $(".RegisterSummonerList > li");
	var allSummoners = $(".Roster > li");
	var allSearchTeams = $(".SearchTeamList > .Item");

	// 팀로고 클릭했을 경우
	allSearchTeams.click(function() {
		var keyword = $(this).data("team-name");
		var selectedTeams = $(".RegisterSummonerList > li[data-team-name='" + keyword.toLowerCase() + "']");

		allTeams.hide();
		allSummoners.hide();

		// 검색텍스트박스 초기화
		searchTextInput.val("");

		if ($(this).hasClass("selected")) {
			allSearchTeams.removeClass("selected");
			allTeams.show();
			allSummoners.show();
		} else {
			allSearchTeams.removeClass("selected");
			$(this).addClass("selected");
			selectedTeams.show();
			selectedTeams.find(".Roster > li").show();
		}
	});

	// 검색텍스트박스에 입력했을 경우
	searchTextInput.on('keyup keydown change', function() {
		var keyword = $(this).val().toLowerCase();
		if (keyword == searchInputPast) {
			return;
		}

		allSearchTeams.removeClass("selected");

		keyword = keyword.replace(/\s/g, ""); // 공백 무시
		searchInputPast = keyword;

		// 검색텍스트박스가 비어있을 경우 전체보기
		if (!keyword) {
			allTeams.show();
			allSummoners.show();
			return;
		}

		var selectedSummoners = $(".Roster > li[data-summoner-name*='"
				+ keyword.toLowerCase() + "'],"
				+ ".Roster > li[data-team-name*='" + keyword.toLowerCase()
				+ "']," + ".Roster > li[data-summoner-extra*='"
				+ keyword.toLowerCase() + "']");

		allTeams.hide();
		allSummoners.hide();

		selectedSummoners.parents("li").show();
		selectedSummoners.show();
	});
});

*/