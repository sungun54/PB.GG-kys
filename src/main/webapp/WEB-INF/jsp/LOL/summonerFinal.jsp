<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../part/head.jspf"%>

<!-- 소환사 CSS -->
<link rel="stylesheet" href="/resource/lol/summoner/summoner.css" />

<!-- 소환사 JS -->
<script src="/resource/lol/summoner/summoner.js"></script>

<div class="l-container">
	<div class="SummonerLayoutWrap">
		<div class="SummonerLayout tabWrap _recognized">
			<div class="Header">
				<script>
					$(function() {
						$.OP.GG.common.SummonerHistory.History
								.add('Hide on bush');

						$.OP.GG.common.SummonerHistory.Favorite.currentSummonerName = 'Hide on bush';
						$.OP.GG.common.SummonerHistory.Favorite
								.loadCurrentSummoner();

						//			$("input[type=text]")
						//					.on('blur', function(){
						//						$.OP.GG.summoner.renewBtn.preventReload = false;
						//					})
						//					.on('focus', function(){
						//						$.OP.GG.summoner.renewBtn.preventReload = true;
						//					});
						/*
						PC방서비스 리더보드를 위한 로직.
						_opfw쿠키가 존재하면 pc방 페이지를 통해 접근한 pc라 판단 소환사 검색 순위를 위해 api콜.
						 */
						var opfw = $.cookie('_opfw');
						if (opfw !== undefined && opfw.indexOf('pcbang') >= 0) {
							var body = {
								game : 'leagueoflegends',
								keywords : 'Hide on bush',
								leaderboardServiceType : 'USER_SEARCH_WORD_RANK'
							};

							$
									.ajax({
										url : 'https://pcbang.op.gg/leaderboard/increment',
										type : "post",
										dataType : "json",
										accept : "application/json",
										contentType : "application/json; charset=utf-8",
										data : JSON.stringify(body),
										success : function(data) {
											// 응답은 무시함.
										},
										error : function(error) {
											// 응답은 무시함.
										}
									});
						}
					});
				</script>

				<div class="PastRank">

					<ul class="PastRankList">
						<li class="Item"><b>S3</b> Diamond</li>
						<li class="Item tip" title="Challenger"><b>S4</b> Challenger</li>
						<li class="Item tip" title="Diamond 2 25LP"><b>S5</b> Diamond</li>
						<li class="Item tip" title="Diamond 2 92LP"><b>S6</b> Diamond</li>
						<li class="Item tip" title="Diamond 1 50LP"><b>S7</b> Diamond</li>
						<li class="Item tip tpd-delegation-uid-1" title=""><b>S8</b>
							Master</li>
						<li class="Item tip" title="Grandmaster 570LP"><b>S9</b>
							Grandmaster</li>
					</ul>
				</div>

				<div class="Face">
					<div class="ProfileIcon">
						<div class="borderImage"
							style="background-image: url(//opgg-static.akamaized.net/images/borders2/grandmaster.png);"></div>
						<img
							src="//opgg-static.akamaized.net/images/profile_icons/profileIcon6.jpg?image=q_auto&amp;v=1518361200"
							class="ProfileImage"> <span
							class="Level tip tpd-delegation-uid-1" title="">347</span>
					</div>
				</div>

				<div class="Profile">
					<div class="Information">
						<div class="Team">
							T1 <span class="Name">[Faker]</span>
						</div>
						<span class="Name">Hide on bush</span> <a class="FavoriteButton"
							href="#" id="FavoriteButton"
							onclick="$.OP.GG.common.SummonerHistory.Favorite.toggle('Hide on bush'); return false;">
							<span class="deactive __spSite __spSite-101" style=""></span> <span
							class="active __spSite __spSite-102" style="display: none;"></span>
							즐겨찾기
						</a>

						<div class="Rank">
							<div class="LadderRank">
								<a href="/ranking/ladder/summonerName=Hide%20on%20bush"
									class="tip Link" title="래더 랭킹 목록에서 보기" target="_blank"> 래더
									랭킹 <span class="ranking">361</span>위 (상위 0.0082%)
								</a>
							</div>
						</div>
					</div>
					<div class="Buttons">
						<button class="Button SemiRound Blue" id="SummonerRefreshButton"
							onclick="$.OP.GG.summoner.renewBtn.start(this, '4460427');"
							style="position: relative;">전적 갱신</button>
						<button id="top_tiergraph" class="Button SemiRound White"
							onclick="$.OP.GG.summoner.openLpHistoryGraph('hideonbush', '#ExtraView');">티어
							그래프</button>
						<button id="top_ifi" class="Button SemiRound IfiGG White"
							onclick="window.open('http://ifi.gg/summoner/Hide on bush', '_blank')">
							롤 몇 시간 했는지 궁금해? <img
								src="//opgg-static.akamaized.net/images/img-nopgg-banner@2x.png">
						</button>
					</div>
				</div>

				<div class="LastUpdate">
					최근 업데이트: <span
						class="_timeago _timeCountAssigned tip tpd-delegation-uid-1"
						data-datetime="1599523688" data-type="" data-interval="60"
						title="2020년 9월 8일 오전 9시 30분">8분 전</span>
				</div>

				<div class="Menu">
					<dl class="MenuList tabHeaders">
						<dd id="left_all" class="Item tabHeader active"
							data-tab-show-class="summonerLayout-summary">
							<a href="/summoner/userName=Hide%20on%20bush">종합</a>
						</dd>
						<dd id="left_champion" class="Item tabHeader"
							data-tab-show-class="summonerLayout-champions">
							<a href="/summoner/champions/userName=Hide%20on%20bush">챔피언</a>
						</dd>
						<dd class="Item tabHeader inGame"
							data-tab-show-class="summonerLayout-spectator"
							data-tab-always-force-load="true">
							<a class="SpectateTabButton" href="#"> <i class="icon"></i> <span
								class="text">인게임 정보</span>
							</a>
						</dd>
					</dl>
				</div>

				<div class="ContentWrap tabItems" id="SummonerLayoutContent">
					<div class="opgg__notice-summoner-top"></div>

					<div
						class="tabItem Content SummonerLayoutContent summonerLayout-summary"
						data-tab-data-url="/summoner/userName=Hide%20on%20bush"
						data-tab-spinner-height="800" data-tab-is-loaded-already="true"
						style="display: block;">

						<div class="SideContent">
							<div class="TierBox Box">
								<div class="SummonerRatingMedium">
									<div class="Medal tip tpd-delegation-uid-1" title="">
										<img
											src="//opgg-static.akamaized.net/images/medals/grandmaster_1.png?image=q_auto&amp;v=1"
											class="Image">
									</div>
									<div class="TierRankInfo">
										<div class="RankType">솔로랭크</div>
										<div class="TierRank">Grandmaster</div>
										<div class="TierInfo">
											<span class="LeaguePoints"> 587 LP </span> / <span
												class="WinLose"> <span class="wins">493승</span> <span
												class="losses">467패</span> <br> <span class="winratio">승률
													51%</span>
											</span>
										</div>
										<div class="LeagueName">초가스의 광신도들</div>
									</div>
								</div>
							</div>

							<div class="sub-tier">
								<img src="//opgg-static.akamaized.net/images/medals/default.png"
									class="Image sub-tier__medal">
								<div class="sub-tier__info unranked">
									<div class="sub-tier__rank-type">자유 5:5 랭크</div>
									<div class="sub-tier__rank-tier unranked">Unranked</div>
								</div>
							</div>
							<div class="Box tabWrap stats-box _recognized">
								<div class="Tab">
									<ul class="TabList tabHeaders">
										<li id="left_champion_all" class="Item tabHeader active"
											data-tab-show-class="overview-stats--all" data-type="Total">
											<a href="#"> S2020 전체 </a>
										</li>
										<li id="left_champion_solorank" class="Item tabHeader"
											data-tab-show-class="overview-stats--soloranked"
											data-type="Solo"><a href="#"> 솔로랭크 </a></li>
										<li id="left_champion_flexrank5v5" class="Item tabHeader"
											data-tab-show-class="overview-stats--flexranked5v5"
											data-type="5vs5"><a href="#"> 자유랭크<br>5v5
										</a></li>
									</ul>
								</div>
								<div class="Content tabItems">
									<div class="MostChampionContent tabItem overview-stats--all"
										style="display: block;">
										<div class="MostChampionContent" data-summoner-id="4460427"
											data-season="15" data-last-info="7">
											<div class="ChampionBox Ranked">
												<div class="Face" title="사일러스">
													<a href="/champion/sylas/statistics" target="_blank"> <img
														src="//opgg-static.akamaized.net/images/lol/champion/Sylas.png?image=q_auto,w_45&amp;v=1596679559"
														width="45" class="ChampionImage" alt="사일러스">
													</a>
												</div>
												<div class="ChampionInfo">
													<div class="ChampionName" title="사일러스">
														<a href="/champion/sylas/statistics" target="_blank">
															사일러스 </a>
													</div>
													<div class="ChampionMinionKill tip" title="평균 CS (CS/분)">
														CS 200.9 (7.8)</div>
												</div>
												<div class="PersonalKDA">
													<div class="KDA normal tip"
														title="(K 5.55 + A 5.49) / D 4.11">
														<span class="KDA">2.69:1</span> <span class="Text">평점</span>
													</div>
													<div class="KDAEach">
														<span class="Kill">5.6</span> <span class="Bar">/</span> <span
															class="Death">4.1</span> <span class="Bar">/</span> <span
															class="Assist">5.5</span>
													</div>
												</div>
												<div class="Played">
													<div class="WinRatio normal tip" title="승률">46%</div>
													<div class="Title">94 게임</div>
												</div>
											</div>
											<div class="ChampionBox Ranked">
												<div class="Face" title="조이">
													<a href="/champion/zoe/statistics" target="_blank"> <img
														src="//opgg-static.akamaized.net/images/lol/champion/Zoe.png?image=q_auto,w_45&amp;v=1596679559"
														width="45" class="ChampionImage" alt="조이">
													</a>
												</div>
												<div class="ChampionInfo">
													<div class="ChampionName" title="조이">
														<a href="/champion/zoe/statistics" target="_blank"> 조이
														</a>
													</div>
													<div class="ChampionMinionKill tip" title="평균 CS (CS/분)">
														CS 209.0 (7.8)</div>
												</div>
												<div class="PersonalKDA">
													<div class="KDA blue tip"
														title="(K 5.82 + A 6.89) / D 2.95">
														<span class="KDA">4.30:1</span> <span class="Text">평점</span>
													</div>
													<div class="KDAEach">
														<span class="Kill">5.8</span> <span class="Bar">/</span> <span
															class="Death">3.0</span> <span class="Bar">/</span> <span
															class="Assist">6.9</span>
													</div>
												</div>
												<div class="Played">
													<div class="WinRatio normal tip" title="승률">53%</div>
													<div class="Title">88 게임</div>
												</div>
											</div>
											<div class="ChampionBox Ranked">
												<div class="Face" title="세트">
													<a href="/champion/sett/statistics" target="_blank"> <img
														src="//opgg-static.akamaized.net/images/lol/champion/Sett.png?image=q_auto,w_45&amp;v=1596679559"
														width="45" class="ChampionImage" alt="세트">
													</a>
												</div>
												<div class="ChampionInfo">
													<div class="ChampionName" title="세트">
														<a href="/champion/sett/statistics" target="_blank">
															세트 </a>
													</div>
													<div class="ChampionMinionKill tip" title="평균 CS (CS/분)">
														CS 188.0 (7.4)</div>
												</div>
												<div class="PersonalKDA">
													<div class="KDA green tip"
														title="(K 4.54 + A 6.45) / D 2.93">
														<span class="KDA">3.75:1</span> <span class="Text">평점</span>
													</div>
													<div class="KDAEach">
														<span class="Kill">4.5</span> <span class="Bar">/</span> <span
															class="Death">2.9</span> <span class="Bar">/</span> <span
															class="Assist">6.4</span>
													</div>
												</div>
												<div class="Played">
													<div class="WinRatio red tip" title="승률">65%</div>
													<div class="Title">69 게임</div>
												</div>
											</div>
											<div class="ChampionBox Ranked">
												<div class="Face" title="르블랑">
													<a href="/champion/leblanc/statistics" target="_blank">
														<img
														src="//opgg-static.akamaized.net/images/lol/champion/Leblanc.png?image=q_auto,w_45&amp;v=1596679559"
														width="45" class="ChampionImage" alt="르블랑">
													</a>
												</div>
												<div class="ChampionInfo">
													<div class="ChampionName" title="르블랑">
														<a href="/champion/leblanc/statistics" target="_blank">
															르블랑 </a>
													</div>
													<div class="ChampionMinionKill tip tpd-delegation-uid-1"
														title="">CS 198.5 (7.6)</div>
												</div>
												<div class="PersonalKDA">
													<div class="KDA blue tip"
														title="(K 6.51 + A 6.12) / D 3.06">
														<span class="KDA">4.13:1</span> <span class="Text">평점</span>
													</div>
													<div class="KDAEach">
														<span class="Kill">6.5</span> <span class="Bar">/</span> <span
															class="Death">3.1</span> <span class="Bar">/</span> <span
															class="Assist">6.1</span>
													</div>
												</div>
												<div class="Played">
													<div class="WinRatio normal tip" title="승률">57%</div>
													<div class="Title">68 게임</div>
												</div>
											</div>
											<div class="ChampionBox Ranked">
												<div class="Face" title="루시안">
													<a href="/champion/lucian/statistics" target="_blank">
														<img
														src="//opgg-static.akamaized.net/images/lol/champion/Lucian.png?image=q_auto,w_45&amp;v=1596679559"
														width="45" class="ChampionImage" alt="루시안">
													</a>
												</div>
												<div class="ChampionInfo">
													<div class="ChampionName" title="루시안">
														<a href="/champion/lucian/statistics" target="_blank">
															루시안 </a>
													</div>
													<div class="ChampionMinionKill tip" title="평균 CS (CS/분)">
														CS 224.6 (8.6)</div>
												</div>
												<div class="PersonalKDA">
													<div class="KDA normal tip"
														title="(K 4.85 + A 5.07) / D 3.84">
														<span class="KDA">2.59:1</span> <span class="Text">평점</span>
													</div>
													<div class="KDAEach">
														<span class="Kill">4.9</span> <span class="Bar">/</span> <span
															class="Death">3.8</span> <span class="Bar">/</span> <span
															class="Assist">5.1</span>
													</div>
												</div>
												<div class="Played">
													<div class="WinRatio normal tip" title="승률">55%</div>
													<div class="Title">67 게임</div>
												</div>
											</div>
											<div class="ChampionBox Ranked">
												<div class="Face" title="아칼리">
													<a href="/champion/akali/statistics" target="_blank"> <img
														src="//opgg-static.akamaized.net/images/lol/champion/Akali.png?image=q_auto,w_45&amp;v=1596679559"
														width="45" class="ChampionImage" alt="아칼리">
													</a>
												</div>
												<div class="ChampionInfo">
													<div class="ChampionName" title="아칼리">
														<a href="/champion/akali/statistics" target="_blank">
															아칼리 </a>
													</div>
													<div class="ChampionMinionKill tip" title="평균 CS (CS/분)">
														CS 213.9 (8.2)</div>
												</div>
												<div class="PersonalKDA">
													<div class="KDA normal tip"
														title="(K 6.27 + A 4.1) / D 3.46">
														<span class="KDA">2.99:1</span> <span class="Text">평점</span>
													</div>
													<div class="KDAEach">
														<span class="Kill">6.3</span> <span class="Bar">/</span> <span
															class="Death">3.5</span> <span class="Bar">/</span> <span
															class="Assist">4.1</span>
													</div>
												</div>
												<div class="Played">
													<div class="WinRatio normal tip" title="승률">46%</div>
													<div class="Title">52 게임</div>
												</div>
											</div>
											<div class="ChampionBox Ranked">
												<div class="Face" title="판테온">
													<a href="/champion/pantheon/statistics" target="_blank">
														<img
														src="//opgg-static.akamaized.net/images/lol/champion/Pantheon.png?image=q_auto,w_45&amp;v=1596679559"
														width="45" class="ChampionImage" alt="판테온">
													</a>
												</div>
												<div class="ChampionInfo">
													<div class="ChampionName" title="판테온">
														<a href="/champion/pantheon/statistics" target="_blank">
															판테온 </a>
													</div>
													<div class="ChampionMinionKill tip" title="평균 CS (CS/분)">
														CS 183.7 (6.8)</div>
												</div>
												<div class="PersonalKDA">
													<div class="KDA green tip"
														title="(K 5.37 + A 6.74) / D 3.77">
														<span class="KDA">3.21:1</span> <span class="Text">평점</span>
													</div>
													<div class="KDAEach">
														<span class="Kill">5.4</span> <span class="Bar">/</span> <span
															class="Death">3.8</span> <span class="Bar">/</span> <span
															class="Assist">6.7</span>
													</div>
												</div>
												<div class="Played">
													<div class="WinRatio normal tip" title="승률">51%</div>
													<div class="Title">35 게임</div>
												</div>
											</div>
											<div id="left_champion_more" class="MoreButton">
												<a href="/summoner/champions/userName=Hide%20on%20bush"
													class="Action">더 보기 + 다른 시즌 보기</a>
											</div>
										</div>
									</div>
									<div class="tabItem overview-stats--soloranked"
										data-tab-data-url="/summoner/champions/ajax/champions.most/summonerId=4460427&amp;season=15&amp;queueType=soloranked"
										style="display: none;"></div>
									<div class="tabItem overview-stats--flexranked5v5"
										data-tab-data-url="/summoner/champions/ajax/champions.most/summonerId=4460427&amp;season=15&amp;queueType=flexranked5v5"
										style="display: none;"></div>
								</div>
							</div>


							<div class="RecentWinRatio Box">
								<div class="Title">최근 7일간 랭크 승률</div>
								<div class="Content">
									<div class="ChampionWinRatioBox">
										<div class="Face">
											<a href="/champion/lucian/statistics" target="_blank"> <i
												class="ChampionImage __sprite __spc32 __spc32-66"
												title="루시안"></i>
											</a>
										</div>
										<div class="ChampionInfo">
											<div class="ChampionName" title="루시안">
												<a href="/champion/lucian/statistics" target="_blank">
													루시안 </a>
											</div>
										</div>
										<div class="WinRatio">56%</div>
										<div class="RatioGraph">
											<div class="WinRatioGraph">
												<div class="Graph">
													<div class="Fill Left __spSite __spSite-6"
														style="width: 55%;"></div>
													<div class="Text Left">5승</div>
													<div class="Fill Right __spSite __spSite-7"></div>
													<div class="Text Right">4패</div>
													<div class="Bar" style="left: 55%;"></div>
												</div>
											</div>
										</div>
									</div>
									<div class="ChampionWinRatioBox">
										<div class="Face">
											<a href="/champion/irelia/statistics" target="_blank"> <i
												class="ChampionImage __sprite __spc32 __spc32-40"
												title="이렐리아"></i>
											</a>
										</div>
										<div class="ChampionInfo">
											<div class="ChampionName" title="이렐리아">
												<a href="/champion/irelia/statistics" target="_blank">
													이렐리아 </a>
											</div>
										</div>
										<div class="WinRatio">50%</div>
										<div class="RatioGraph">
											<div class="WinRatioGraph">
												<div class="Graph">
													<div class="Fill Left __spSite __spSite-6"
														style="width: 50%;"></div>
													<div class="Text Left">2승</div>
													<div class="Fill Right __spSite __spSite-7"></div>
													<div class="Text Right">2패</div>
													<div class="Bar" style="left: 50%;"></div>
												</div>
											</div>
										</div>
									</div>
									<div class="ChampionWinRatioBox">
										<div class="Face">
											<a href="/champion/akali/statistics" target="_blank"> <i
												class="ChampionImage __sprite __spc32 __spc32-2" title="아칼리"></i>
											</a>
										</div>
										<div class="ChampionInfo">
											<div class="ChampionName" title="아칼리">
												<a href="/champion/akali/statistics" target="_blank">
													아칼리 </a>
											</div>
										</div>
										<div class="WinRatio">100%</div>
										<div class="RatioGraph">
											<div class="WinRatioGraph">
												<div class="Graph">
													<div class="Fill Left __spSite __spSite-6"
														style="width: 100%;"></div>
													<div class="Text Left">2승</div>
												</div>
											</div>
										</div>
									</div>
									<div class="ChampionWinRatioBox">
										<div class="Face">
											<a href="/champion/kalista/statistics" target="_blank"> <i
												class="ChampionImage __sprite __spc32 __spc32-49"
												title="칼리스타"></i>
											</a>
										</div>
										<div class="ChampionInfo">
											<div class="ChampionName" title="칼리스타">
												<a href="/champion/kalista/statistics" target="_blank">
													칼리스타 </a>
											</div>
										</div>
										<div class="WinRatio">50%</div>
										<div class="RatioGraph">
											<div class="WinRatioGraph">
												<div class="Graph">
													<div class="Fill Left __spSite __spSite-6"
														style="width: 50%;"></div>
													<div class="Text Left">1승</div>
													<div class="Fill Right __spSite __spSite-7"></div>
													<div class="Text Right">1패</div>
													<div class="Bar" style="left: 50%;"></div>
												</div>
											</div>
										</div>
									</div>
									<div class="ChampionWinRatioBox">
										<div class="Face">
											<a href="/champion/pantheon/statistics" target="_blank">
												<i class="ChampionImage __sprite __spc32 __spc32-87"
												title="판테온"></i>
											</a>
										</div>
										<div class="ChampionInfo">
											<div class="ChampionName" title="판테온">
												<a href="/champion/pantheon/statistics" target="_blank">
													판테온 </a>
											</div>
										</div>
										<div class="WinRatio">50%</div>
										<div class="RatioGraph">
											<div class="WinRatioGraph">
												<div class="Graph">
													<div class="Fill Left __spSite __spSite-6"
														style="width: 50%;"></div>
													<div class="Text Left">1승</div>
													<div class="Fill Right __spSite __spSite-7"></div>
													<div class="Text Right">1패</div>
													<div class="Bar" style="left: 50%;"></div>
												</div>
											</div>
										</div>
									</div>
									<div class="ChampionWinRatioBox">
										<div class="Face">
											<a href="/champion/camille/statistics" target="_blank"> <i
												class="ChampionImage __sprite __spc32 __spc32-16" title="카밀"></i>
											</a>
										</div>
										<div class="ChampionInfo">
											<div class="ChampionName" title="카밀">
												<a href="/champion/camille/statistics" target="_blank">
													카밀 </a>
											</div>
										</div>
										<div class="WinRatio">50%</div>
										<div class="RatioGraph">
											<div class="WinRatioGraph">
												<div class="Graph">
													<div class="Fill Left __spSite __spSite-6"
														style="width: 50%;"></div>
													<div class="Text Left">1승</div>
													<div class="Fill Right __spSite __spSite-7"></div>
													<div class="Text Right">1패</div>
													<div class="Bar" style="left: 50%;"></div>
												</div>
											</div>
										</div>
									</div>
									<div class="ChampionWinRatioBox">
										<div class="Face">
											<a href="/champion/orianna/statistics" target="_blank"> <i
												class="ChampionImage __sprite __spc32 __spc32-85"
												title="오리아나"></i>
											</a>
										</div>
										<div class="ChampionInfo">
											<div class="ChampionName" title="오리아나">
												<a href="/champion/orianna/statistics" target="_blank">
													오리아나 </a>
											</div>
										</div>
										<div class="WinRatio">50%</div>
										<div class="RatioGraph">
											<div class="WinRatioGraph">
												<div class="Graph">
													<div class="Fill Left __spSite __spSite-6"
														style="width: 50%;"></div>
													<div class="Text Left">1승</div>
													<div class="Fill Right __spSite __spSite-7"></div>
													<div class="Text Right">1패</div>
													<div class="Bar" style="left: 50%;"></div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>


							<div class="SummonersMostGame Box">
								<div class="Title">같은 팀으로 게임한 소환사들 (최근 20 게임)</div>
								<div class="Content">
									<table
										class="SummonersMostGameTable sortable tablesorter tablesorter-default"
										role="grid">
										<colgroup>
											<col>
											<col width="50">
											<col width="45">
											<col width="45">
											<col width="70">
										</colgroup>
										<thead class="Header">
											<tr class="Row tablesorter-headerRow" role="row">
												<th
													class="SummonerName HeaderCell tablesorter-header tablesorter-headerUnSorted"
													data-column="0" tabindex="0" scope="col"
													role="columnheader" aria-disabled="false" unselectable="on"
													aria-sort="none"
													aria-label="소환사: No sort applied, activate to apply an ascending sort"
													style="user-select: none;"><div
														class="tablesorter-header-inner">소환사</div></th>
												<th
													class="GameCount HeaderCell tablesorter-header tablesorter-headerUnSorted"
													data-column="1" tabindex="0" scope="col"
													role="columnheader" aria-disabled="false" unselectable="on"
													aria-sort="none"
													aria-label="게임: No sort applied, activate to apply a descending sort"
													style="user-select: none;"><div
														class="tablesorter-header-inner">게임</div></th>
												<th
													class="Win HeaderCell tablesorter-header tablesorter-headerUnSorted"
													data-column="2" tabindex="0" scope="col"
													role="columnheader" aria-disabled="false" unselectable="on"
													aria-sort="none"
													aria-label="승: No sort applied, activate to apply a descending sort"
													style="user-select: none;"><div
														class="tablesorter-header-inner">승</div></th>
												<th
													class="Lose HeaderCell tablesorter-header tablesorter-headerUnSorted"
													data-column="3" tabindex="0" scope="col"
													role="columnheader" aria-disabled="false" unselectable="on"
													aria-sort="none"
													aria-label="패: No sort applied, activate to apply a descending sort"
													style="user-select: none;"><div
														class="tablesorter-header-inner">패</div></th>
												<th
													class="WinRatio HeaderCell tablesorter-header tablesorter-headerUnSorted"
													data-column="4" tabindex="0" scope="col"
													role="columnheader" aria-disabled="false" unselectable="on"
													aria-sort="none"
													aria-label="승률: No sort applied, activate to apply a descending sort"
													style="user-select: none;"><div
														class="tablesorter-header-inner">승률</div></th>
											</tr>
										</thead>
										<tbody class="Body" aria-live="polite" aria-relevant="all">
											<tr class="Row Odd" role="row">
												<td
													class="SummonerName Cell left_select_played_with_summoner">
													<a
													href="//www.op.gg/summoner/userName=%EC%A0%80%EB%8A%94%EB%AA%BB%ED%95%B4%EC%9A%94asd"
													class="Link">저는못해요asd</a>
												</td>
												<td class="GameCount Cell">3</td>
												<td class="Win Cell">1</td>
												<td class="Lose Cell">2</td>
												<td class="WinRatio Cell">33%</td>
											</tr>
											<tr class="Row " role="row">
												<td
													class="SummonerName Cell left_select_played_with_summoner">
													<a href="//www.op.gg/summoner/userName=EM+Karas"
													class="Link">EM Karas</a>
												</td>
												<td class="GameCount Cell">3</td>
												<td class="Win Cell">1</td>
												<td class="Lose Cell">2</td>
												<td class="WinRatio Cell">33%</td>
											</tr>
											<tr class="Row Odd" role="row">
												<td
													class="SummonerName Cell left_select_played_with_summoner">
													<a
													href="//www.op.gg/summoner/userName=%EB%B0%A4%EC%9D%B4%EC%8B%AB%EC%96%B4"
													class="Link">밤이싫어</a>
												</td>
												<td class="GameCount Cell">2</td>
												<td class="Win Cell">0</td>
												<td class="Lose Cell">2</td>
												<td class="WinRatio Cell">0%</td>
											</tr>
											<tr class="Row " role="row">
												<td
													class="SummonerName Cell left_select_played_with_summoner">
													<a
													href="//www.op.gg/summoner/userName=%EB%B3%84%EC%82%AC%ED%83%95%EC%9D%B4%EC%A2%8B%EC%95%84%EC%9A%94"
													class="Link">별사탕이좋아요</a>
												</td>
												<td class="GameCount Cell">2</td>
												<td class="Win Cell">0</td>
												<td class="Lose Cell">2</td>
												<td class="WinRatio Cell">0%</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>


							<div class="LifeOwnerSummonerLeftSide">
								<div class="life-owner Size-300x250">
									<!-- Venatus Market v3 - OP.GG - 300x250 Dynamic -->
									<div class="vm-placement" data-id="5a84641d46e0fb0001fc3bb2"
										data-reg="true" data-pos="1" id="5a84641d46e0fb0001fc3bb2-1"
										style="background: url(&quot;https://hb.vntsm.com/assets/op_loader.gif&quot;) center center no-repeat rgb(242, 242, 242); border: 1px solid rgb(213, 216, 216); position: relative; margin: 0px auto; overflow: hidden; max-width: 300px;"
										data-google-query-id="CJC7uYGo2OsCFRQKXAod4x0INw">
										<div
											id="google_ads_iframe_/21726375739/VM_5a8460b346e0fb0001fc3bac_1__container__"
											style="border: 0pt none; display: block; margin: 0px auto;">
											<iframe
												id="google_ads_iframe_/21726375739/VM_5a8460b346e0fb0001fc3bac_1"
												title="3rd party ad content"
												name="google_ads_iframe_/21726375739/VM_5a8460b346e0fb0001fc3bac_1"
												width="300" height="250" scrolling="no" marginwidth="0"
												marginheight="0" frameborder="0" srcdoc=""
												sandbox="allow-forms allow-pointer-lock allow-popups allow-same-origin allow-scripts allow-top-navigation-by-user-activation allow-presentation"
												style="border: 0px; vertical-align: bottom;"
												data-google-container-id="7" data-load-complete="true"></iframe>
										</div>
									</div>
									<!-- / Venatus Market v3 - OP.GG - 300x250 Dynamic -->
								</div>
							</div>
							<div class="opgg__notice--left"></div>
							<div class="opgg__notice--right"></div>
						</div>


						<div class="RealContent">
							<div class="GameListContainer" data-summoner-id="4460427"
								data-last-info="1599232950">
								<div class="Header Box">
									<style>
.SelectMatchTypes, .ChampionMatchSearchWrap>.Content {
	display: none;
}
</style>
									<script>
										$(function() {
											var wrap = $('.ChampionMatchSearchWrap'), content = $(
													'>.Content', wrap), allChampionList = $(
													">.SelectMatchChampionList >.Item.All .ChampionList",
													content);

											var searchInputPast = null;
											var doubleChosungArray = {
												'ㄳ' : 'ㄱㅅ',
												'ㄵ' : 'ㄴㅈ',
												'ㄶ' : 'ㄴㅎ',
												'ㄺ' : 'ㄹㄱ',
												'ㄻ' : 'ㄹㅁ',
												'ㄼ' : 'ㄹㅂ',
												'ㄽ' : 'ㄹㅅ',
												'ㄾ' : 'ㄹㅌ',
												'ㄿ' : 'ㄹㅍ',
												'ㅀ' : 'ㄹㅎ',
												'ㅄ' : 'ㅂㅅ'
											};

											var updateSearchKeyword = function(
													oSearchInput) {
												var keyword = oSearchInput
														.val().toLowerCase();
												var allChampionHeader = $(
														">.AllChampion",
														allChampionList);
												var allChampions = $(">.Item",
														allChampionList);

												if (keyword.length > 0) {
													allChampionHeader.show();
												}

												//				if (keyword == searchInputPast) {
												//					return;
												//				}

												for ( var doubleChosung in doubleChosungArray) {
													if (doubleChosungArray
															.hasOwnProperty(doubleChosung)) {
														var spritedChosung = doubleChosungArray[doubleChosung];
														keyword = keyword
																.replaceAll(
																		doubleChosung,
																		spritedChosung);
													}
												}

												searchInputPast = keyword;

												allChampions
														.each(function(i, o) {
															var championName = $(
																	o)
																	.data(
																			'champion-name'), championKey = $(
																	o)
																	.data(
																			'champion-key'), championNameChosung = $(
																	o)
																	.data(
																			'champion-name-chosung');

															if (championName) {
																if (championName
																		.indexOf(keyword) >= 0
																		|| championKey
																				.indexOf(keyword) >= 0
																		|| (championNameChosung && championNameChosung
																				.indexOf(keyword) >= 0)) {
																	$(o)
																			.removeClass(
																					'hide');
																	$(o)
																			.addClass(
																					'show');
																} else {
																	$(o)
																			.removeClass(
																					'show');
																	$(o)
																			.addClass(
																					'hide');
																}
															}
														});

												var championNotFound = $(
														">.ChampionNotFound",
														allChampionList);
												if ($(">.Item.show",
														allChampionList).length == 0) {
													championNotFound.show();
												} else {
													championNotFound.hide();
												}
											};

											var showChampionMatchSearch = function() {
												// 중복 이벤트 할당 문제
												if (content.is(':visible')) {
													return;
												}

												content.show();
												$(document)
														.on(
																'click',
																function(event) {
																	var target = event.target
																			|| event.srcElement;
																	if (!$(
																			target)
																			.closest(
																					wrap.selector).length) {
																		hideChampionMatchSearch();
																	}
																});
											}, hideChampionMatchSearch = function() {
												content.hide();
												$(document).off('click');
											};

											// 아무키나 누르면 띄워주도록
											var searchInput = $(
													'>.Header >.Input', wrap);
											searchInput
													.on(
															'keyup keydown change click',
															function() {
																// 엔터키 입력 시 챔피언 리스트 숨길지 컨셉 필요
																showChampionMatchSearch();
																updateSearchKeyword($(this));
																ga(
																		'send',
																		'event',
																		'button',
																		'OpenChampionSearchInMatch');
															})
													.keypress(
															function(event) {
																if (event.charCode === 13) {
																	var serachText = $(".ChampionMatchSearchWrap > .Header > .Input")[0].value;
																	$(
																			".ChampionList > .Item > .Link")
																			.each(
																					function(
																							index,
																							value) {
																						if (value.innerHTML
																								.trim()
																								.toLowerCase()
																								.split(
																										" ")
																								.join(
																										"") === serachText
																								.trim()
																								.toLowerCase()
																								.split(
																										" ")
																								.join(
																										"")) {
																							$.OP.GG.matches.list
																									.changeChampion($(
																											value)
																											.data(
																													'champion-id'));
																							// 엔터키 입력 시 챔피언 리스트 숨길지 컨셉 필요
																							$(
																									document)
																									.off(
																											'click');
																							return;
																						}
																					});
																}
															});
										});
									</script>
									<div class="Navigation">
										<ul class="List Type">
											<li id="right_gametype_total" class="Item active"
												data-type="total"><a href="#" class="Link"
												data-type="total"
												onclick="$.OP.GG.matches.list.changeType($(this).data('type'), $(this)); return false;">전체</a>
											</li>
											<li id="right_gametype_soloranked" class="Item "
												data-type="soloranked"><a href="#" class="Link"
												data-type="soloranked"
												onclick="$.OP.GG.matches.list.changeType($(this).data('type'), $(this)); return false;">솔로랭크</a>
											</li>
											<li id="right_gametype_flexranked" class="Item "
												data-type="flexranked"><a href="#" class="Link"
												data-type="flexranked"
												onclick="$.OP.GG.matches.list.changeType($(this).data('type'), $(this)); return false;">자유랭크</a>
											</li>
											<li id="right_gametype_queuetype" class="Item"
												data-type="etc"><span
												class="jcf-select jcf-unselectable jcf-select-SelectMatchTypes"><select
													class="SelectMatchTypes jcf-reset-appearance"
													data-type="etc"
													onchange="$.OP.GG.matches.list.changeType($(this).data('type'), $(this), $('option:selected', this).val()); return false;"
													style="position: absolute; height: 100%; width: 100%;">
														<option value="">큐 타입</option>
														<option value="normal">일반 (비공개 선택)</option>
														<option value="aram">무작위 총력전</option>
														<option value="bot">AI 상대 대전</option>
														<option value="clash">격전</option>
														<option value="event">이벤트 게임</option>
												</select><span class="jcf-select-text"><span class="">큐
															타입</span></span><span class="jcf-select-opener"></span></span></li>
										</ul>
										<div class="Actions">
											<div class="Action">
												<div class="ChampionMatchSearchWrap">
													<div id="right_search_champion" class="Header">
														<input type="text" class="Input" placeholder="챔피언 검색">

														<div class="Action">
															<i class="__spSite __spSite-227"></i>
														</div>
													</div>
													<div class="Content">
														<ul class="SelectMatchChampionList short">
															<li class="Item Recent">
																<div class="Header">최근 플레이</div>
																<div class="Content">
																	<ul class="ChampionList">
																		<li class="Item"><a href="#"
																			data-champion-id="39" class="Link">이렐리아</a></li>
																		<li class="Item"><a href="#"
																			data-champion-id="164" class="Link">카밀</a></li>
																		<li class="Item"><a href="#"
																			data-champion-id="236" class="Link">루시안</a></li>
																		<li class="Item"><a href="#"
																			data-champion-id="876" class="Link">릴리아</a></li>
																		<li class="Item"><a href="#"
																			data-champion-id="517" class="Link">사일러스</a></li>
																		<li class="Item"><a href="#"
																			data-champion-id="85" class="Link">케넨</a></li>
																		<li class="Item"><a href="#"
																			data-champion-id="53" class="Link">블리츠크랭크</a></li>
																		<li class="Item"><a href="#"
																			data-champion-id="58" class="Link">레넥톤</a></li>
																		<li class="Item"><a href="#"
																			data-champion-id="69" class="Link">카시오페아</a></li>
																		<li class="Item"><a href="#"
																			data-champion-id="421" class="Link">렉사이</a></li>
																		<li class="Item"><a href="#"
																			data-champion-id="429" class="Link">칼리스타</a></li>
																	</ul>
																</div>
															</li>
															<li class="Item All">
																<div class="Header">챔피언 목록</div>
																<div class="Content">
																	<ul class="ChampionList">
																		<li class="Item AllChampion"><a href="#"
																			data-champion-id="" class="Link">모든 챔피언</a></li>
																		<li class="Item" data-champion-name="가렌"
																			data-champion-key="garen"
																			data-champion-name-chosung="ㄱㄹ"><a href="#"
																			data-champion-id="86" class="Link">가렌</a></li>
																		<li class="Item" data-champion-name="갈리오"
																			data-champion-key="galio"
																			data-champion-name-chosung="ㄱㄹㅇ"><a href="#"
																			data-champion-id="3" class="Link">갈리오</a></li>
																		<li class="Item" data-champion-name="갱플랭크"
																			data-champion-key="gangplank"
																			data-champion-name-chosung="ㄱㅍㄹㅋ"><a href="#"
																			data-champion-id="41" class="Link">갱플랭크</a></li>
																		<li class="Item" data-champion-name="그라가스"
																			data-champion-key="gragas"
																			data-champion-name-chosung="ㄱㄹㄱㅅ"><a href="#"
																			data-champion-id="79" class="Link">그라가스</a></li>
																		<li class="Item" data-champion-name="그레이브즈"
																			data-champion-key="graves"
																			data-champion-name-chosung="ㄱㄹㅇㅂㅈ"><a href="#"
																			data-champion-id="104" class="Link">그레이브즈</a></li>
																		<li class="Item" data-champion-name="나르"
																			data-champion-key="gnar"
																			data-champion-name-chosung="ㄴㄹ"><a href="#"
																			data-champion-id="150" class="Link">나르</a></li>
																		<li class="Item" data-champion-name="나미"
																			data-champion-key="nami"
																			data-champion-name-chosung="ㄴㅁ"><a href="#"
																			data-champion-id="267" class="Link">나미</a></li>
																		<li class="Item" data-champion-name="나서스"
																			data-champion-key="nasus"
																			data-champion-name-chosung="ㄴㅅㅅ"><a href="#"
																			data-champion-id="75" class="Link">나서스</a></li>
																		<li class="Item" data-champion-name="노틸러스"
																			data-champion-key="nautilus"
																			data-champion-name-chosung="ㄴㅌㄹㅅ"><a href="#"
																			data-champion-id="111" class="Link">노틸러스</a></li>
																		<li class="Item" data-champion-name="녹턴"
																			data-champion-key="nocturne"
																			data-champion-name-chosung="ㄴㅌ"><a href="#"
																			data-champion-id="56" class="Link">녹턴</a></li>
																		<li class="Item" data-champion-name="누누와윌럼프"
																			data-champion-key="nunu"
																			data-champion-name-chosung="ㄴㄴㅇㅇㄹㅍ"><a href="#"
																			data-champion-id="20" class="Link">누누와 윌럼프</a></li>
																		<li class="Item" data-champion-name="니달리"
																			data-champion-key="nidalee"
																			data-champion-name-chosung="ㄴㄷㄹ"><a href="#"
																			data-champion-id="76" class="Link">니달리</a></li>
																		<li class="Item" data-champion-name="니코"
																			data-champion-key="neeko"
																			data-champion-name-chosung="ㄴㅋ"><a href="#"
																			data-champion-id="518" class="Link">니코</a></li>
																		<li class="Item" data-champion-name="다리우스"
																			data-champion-key="darius"
																			data-champion-name-chosung="ㄷㄹㅇㅅ"><a href="#"
																			data-champion-id="122" class="Link">다리우스</a></li>
																		<li class="Item" data-champion-name="다이애나"
																			data-champion-key="diana"
																			data-champion-name-chosung="ㄷㅇㅇㄴ"><a href="#"
																			data-champion-id="131" class="Link">다이애나</a></li>
																		<li class="Item" data-champion-name="드레이븐"
																			data-champion-key="draven"
																			data-champion-name-chosung="ㄷㄹㅇㅂ"><a href="#"
																			data-champion-id="119" class="Link">드레이븐</a></li>
																		<li class="Item" data-champion-name="라이즈"
																			data-champion-key="ryze"
																			data-champion-name-chosung="ㄹㅇㅈ"><a href="#"
																			data-champion-id="13" class="Link">라이즈</a></li>
																		<li class="Item" data-champion-name="라칸"
																			data-champion-key="rakan"
																			data-champion-name-chosung="ㄹㅋ"><a href="#"
																			data-champion-id="497" class="Link">라칸</a></li>
																		<li class="Item" data-champion-name="람머스"
																			data-champion-key="rammus"
																			data-champion-name-chosung="ㄹㅁㅅ"><a href="#"
																			data-champion-id="33" class="Link">람머스</a></li>
																		<li class="Item" data-champion-name="럭스"
																			data-champion-key="lux"
																			data-champion-name-chosung="ㄹㅅ"><a href="#"
																			data-champion-id="99" class="Link">럭스</a></li>
																		<li class="Item" data-champion-name="럼블"
																			data-champion-key="rumble"
																			data-champion-name-chosung="ㄹㅂ"><a href="#"
																			data-champion-id="68" class="Link">럼블</a></li>
																		<li class="Item" data-champion-name="레넥톤"
																			data-champion-key="renekton"
																			data-champion-name-chosung="ㄹㄴㅌ"><a href="#"
																			data-champion-id="58" class="Link">레넥톤</a></li>
																		<li class="Item" data-champion-name="레오나"
																			data-champion-key="leona"
																			data-champion-name-chosung="ㄹㅇㄴ"><a href="#"
																			data-champion-id="89" class="Link">레오나</a></li>
																		<li class="Item" data-champion-name="렉사이"
																			data-champion-key="reksai"
																			data-champion-name-chosung="ㄹㅅㅇ"><a href="#"
																			data-champion-id="421" class="Link">렉사이</a></li>
																		<li class="Item" data-champion-name="렝가"
																			data-champion-key="rengar"
																			data-champion-name-chosung="ㄹㄱ"><a href="#"
																			data-champion-id="107" class="Link">렝가</a></li>
																		<li class="Item" data-champion-name="루시안"
																			data-champion-key="lucian"
																			data-champion-name-chosung="ㄹㅅㅇ"><a href="#"
																			data-champion-id="236" class="Link">루시안</a></li>
																		<li class="Item" data-champion-name="룰루"
																			data-champion-key="lulu"
																			data-champion-name-chosung="ㄹㄹ"><a href="#"
																			data-champion-id="117" class="Link">룰루</a></li>
																		<li class="Item" data-champion-name="르블랑"
																			data-champion-key="leblanc"
																			data-champion-name-chosung="ㄹㅂㄹ"><a href="#"
																			data-champion-id="7" class="Link">르블랑</a></li>
																		<li class="Item" data-champion-name="리신"
																			data-champion-key="leesin"
																			data-champion-name-chosung="ㄹㅅ"><a href="#"
																			data-champion-id="64" class="Link">리 신</a></li>
																		<li class="Item" data-champion-name="리븐"
																			data-champion-key="riven"
																			data-champion-name-chosung="ㄹㅂ"><a href="#"
																			data-champion-id="92" class="Link">리븐</a></li>
																		<li class="Item" data-champion-name="리산드라"
																			data-champion-key="lissandra"
																			data-champion-name-chosung="ㄹㅅㄷㄹ"><a href="#"
																			data-champion-id="127" class="Link">리산드라</a></li>
																		<li class="Item" data-champion-name="릴리아"
																			data-champion-key="lillia"
																			data-champion-name-chosung="ㄹㄹㅇ"><a href="#"
																			data-champion-id="876" class="Link">릴리아</a></li>
																		<li class="Item" data-champion-name="마스터이"
																			data-champion-key="masteryi"
																			data-champion-name-chosung="ㅁㅅㅌㅇ"><a href="#"
																			data-champion-id="11" class="Link">마스터 이</a></li>
																		<li class="Item" data-champion-name="마오카이"
																			data-champion-key="maokai"
																			data-champion-name-chosung="ㅁㅇㅋㅇ"><a href="#"
																			data-champion-id="57" class="Link">마오카이</a></li>
																		<li class="Item" data-champion-name="말자하"
																			data-champion-key="malzahar"
																			data-champion-name-chosung="ㅁㅈㅎ"><a href="#"
																			data-champion-id="90" class="Link">말자하</a></li>
																		<li class="Item" data-champion-name="말파이트"
																			data-champion-key="malphite"
																			data-champion-name-chosung="ㅁㅍㅇㅌ"><a href="#"
																			data-champion-id="54" class="Link">말파이트</a></li>
																		<li class="Item" data-champion-name="모데카이저"
																			data-champion-key="mordekaiser"
																			data-champion-name-chosung="ㅁㄷㅋㅇㅈ"><a href="#"
																			data-champion-id="82" class="Link">모데카이저</a></li>
																		<li class="Item" data-champion-name="모르가나"
																			data-champion-key="morgana"
																			data-champion-name-chosung="ㅁㄹㄱㄴ"><a href="#"
																			data-champion-id="25" class="Link">모르가나</a></li>
																		<li class="Item" data-champion-name="문도박사"
																			data-champion-key="drmundo"
																			data-champion-name-chosung="ㅁㄷㅂㅅ"><a href="#"
																			data-champion-id="36" class="Link">문도 박사</a></li>
																		<li class="Item" data-champion-name="미스포츈"
																			data-champion-key="missfortune"
																			data-champion-name-chosung="ㅁㅅㅍㅊ"><a href="#"
																			data-champion-id="21" class="Link">미스 포츈</a></li>
																		<li class="Item" data-champion-name="바드"
																			data-champion-key="bard"
																			data-champion-name-chosung="ㅂㄷ"><a href="#"
																			data-champion-id="432" class="Link">바드</a></li>
																		<li class="Item" data-champion-name="바루스"
																			data-champion-key="varus"
																			data-champion-name-chosung="ㅂㄹㅅ"><a href="#"
																			data-champion-id="110" class="Link">바루스</a></li>
																		<li class="Item" data-champion-name="바이"
																			data-champion-key="vi"
																			data-champion-name-chosung="ㅂㅇ"><a href="#"
																			data-champion-id="254" class="Link">바이</a></li>
																		<li class="Item" data-champion-name="베이가"
																			data-champion-key="veigar"
																			data-champion-name-chosung="ㅂㅇㄱ"><a href="#"
																			data-champion-id="45" class="Link">베이가</a></li>
																		<li class="Item" data-champion-name="베인"
																			data-champion-key="vayne"
																			data-champion-name-chosung="ㅂㅇ"><a href="#"
																			data-champion-id="67" class="Link">베인</a></li>
																		<li class="Item" data-champion-name="벨코즈"
																			data-champion-key="velkoz"
																			data-champion-name-chosung="ㅂㅋㅈ"><a href="#"
																			data-champion-id="161" class="Link">벨코즈</a></li>
																		<li class="Item" data-champion-name="볼리베어"
																			data-champion-key="volibear"
																			data-champion-name-chosung="ㅂㄹㅂㅇ"><a href="#"
																			data-champion-id="106" class="Link">볼리베어</a></li>
																		<li class="Item" data-champion-name="브라움"
																			data-champion-key="braum"
																			data-champion-name-chosung="ㅂㄹㅇ"><a href="#"
																			data-champion-id="201" class="Link">브라움</a></li>
																		<li class="Item" data-champion-name="브랜드"
																			data-champion-key="brand"
																			data-champion-name-chosung="ㅂㄹㄷ"><a href="#"
																			data-champion-id="63" class="Link">브랜드</a></li>
																		<li class="Item" data-champion-name="블라디미르"
																			data-champion-key="vladimir"
																			data-champion-name-chosung="ㅂㄹㄷㅁㄹ"><a href="#"
																			data-champion-id="8" class="Link">블라디미르</a></li>
																		<li class="Item" data-champion-name="블리츠크랭크"
																			data-champion-key="blitzcrank"
																			data-champion-name-chosung="ㅂㄹㅊㅋㄹㅋ"><a href="#"
																			data-champion-id="53" class="Link">블리츠크랭크</a></li>
																		<li class="Item" data-champion-name="빅토르"
																			data-champion-key="viktor"
																			data-champion-name-chosung="ㅂㅌㄹ"><a href="#"
																			data-champion-id="112" class="Link">빅토르</a></li>
																		<li class="Item" data-champion-name="뽀삐"
																			data-champion-key="poppy"
																			data-champion-name-chosung="ㅃㅃ"><a href="#"
																			data-champion-id="78" class="Link">뽀삐</a></li>
																		<li class="Item" data-champion-name="사이온"
																			data-champion-key="sion"
																			data-champion-name-chosung="ㅅㅇㅇ"><a href="#"
																			data-champion-id="14" class="Link">사이온</a></li>
																		<li class="Item" data-champion-name="사일러스"
																			data-champion-key="sylas"
																			data-champion-name-chosung="ㅅㅇㄹㅅ"><a href="#"
																			data-champion-id="517" class="Link">사일러스</a></li>
																		<li class="Item" data-champion-name="샤코"
																			data-champion-key="shaco"
																			data-champion-name-chosung="ㅅㅋ"><a href="#"
																			data-champion-id="35" class="Link">샤코</a></li>
																		<li class="Item" data-champion-name="세나"
																			data-champion-key="senna"
																			data-champion-name-chosung="ㅅㄴ"><a href="#"
																			data-champion-id="235" class="Link">세나</a></li>
																		<li class="Item" data-champion-name="세주아니"
																			data-champion-key="sejuani"
																			data-champion-name-chosung="ㅅㅈㅇㄴ"><a href="#"
																			data-champion-id="113" class="Link">세주아니</a></li>
																		<li class="Item" data-champion-name="세트"
																			data-champion-key="sett"
																			data-champion-name-chosung="ㅅㅌ"><a href="#"
																			data-champion-id="875" class="Link">세트</a></li>
																		<li class="Item" data-champion-name="소나"
																			data-champion-key="sona"
																			data-champion-name-chosung="ㅅㄴ"><a href="#"
																			data-champion-id="37" class="Link">소나</a></li>
																		<li class="Item" data-champion-name="소라카"
																			data-champion-key="soraka"
																			data-champion-name-chosung="ㅅㄹㅋ"><a href="#"
																			data-champion-id="16" class="Link">소라카</a></li>
																		<li class="Item" data-champion-name="쉔"
																			data-champion-key="shen"
																			data-champion-name-chosung="ㅅ"><a href="#"
																			data-champion-id="98" class="Link">쉔</a></li>
																		<li class="Item" data-champion-name="쉬바나"
																			data-champion-key="shyvana"
																			data-champion-name-chosung="ㅅㅂㄴ"><a href="#"
																			data-champion-id="102" class="Link">쉬바나</a></li>
																		<li class="Item" data-champion-name="스웨인"
																			data-champion-key="swain"
																			data-champion-name-chosung="ㅅㅇㅇ"><a href="#"
																			data-champion-id="50" class="Link">스웨인</a></li>
																		<li class="Item" data-champion-name="스카너"
																			data-champion-key="skarner"
																			data-champion-name-chosung="ㅅㅋㄴ"><a href="#"
																			data-champion-id="72" class="Link">스카너</a></li>
																		<li class="Item" data-champion-name="시비르"
																			data-champion-key="sivir"
																			data-champion-name-chosung="ㅅㅂㄹ"><a href="#"
																			data-champion-id="15" class="Link">시비르</a></li>
																		<li class="Item" data-champion-name="신짜오"
																			data-champion-key="xinzhao"
																			data-champion-name-chosung="ㅅㅉㅇ"><a href="#"
																			data-champion-id="5" class="Link">신 짜오</a></li>
																		<li class="Item" data-champion-name="신드라"
																			data-champion-key="syndra"
																			data-champion-name-chosung="ㅅㄷㄹ"><a href="#"
																			data-champion-id="134" class="Link">신드라</a></li>
																		<li class="Item" data-champion-name="신지드"
																			data-champion-key="singed"
																			data-champion-name-chosung="ㅅㅈㄷ"><a href="#"
																			data-champion-id="27" class="Link">신지드</a></li>
																		<li class="Item" data-champion-name="쓰레쉬"
																			data-champion-key="thresh"
																			data-champion-name-chosung="ㅆㄹㅅ"><a href="#"
																			data-champion-id="412" class="Link">쓰레쉬</a></li>
																		<li class="Item" data-champion-name="아리"
																			data-champion-key="ahri"
																			data-champion-name-chosung="ㅇㄹ"><a href="#"
																			data-champion-id="103" class="Link">아리</a></li>
																		<li class="Item" data-champion-name="아무무"
																			data-champion-key="amumu"
																			data-champion-name-chosung="ㅇㅁㅁ"><a href="#"
																			data-champion-id="32" class="Link">아무무</a></li>
																		<li class="Item" data-champion-name="아우렐리온솔"
																			data-champion-key="aurelionsol"
																			data-champion-name-chosung="ㅇㅇㄹㄹㅇㅅ"><a href="#"
																			data-champion-id="136" class="Link">아우렐리온 솔</a></li>
																		<li class="Item" data-champion-name="아이번"
																			data-champion-key="ivern"
																			data-champion-name-chosung="ㅇㅇㅂ"><a href="#"
																			data-champion-id="427" class="Link">아이번</a></li>
																		<li class="Item" data-champion-name="아지르"
																			data-champion-key="azir"
																			data-champion-name-chosung="ㅇㅈㄹ"><a href="#"
																			data-champion-id="268" class="Link">아지르</a></li>
																		<li class="Item" data-champion-name="아칼리"
																			data-champion-key="akali"
																			data-champion-name-chosung="ㅇㅋㄹ"><a href="#"
																			data-champion-id="84" class="Link">아칼리</a></li>
																		<li class="Item" data-champion-name="아트록스"
																			data-champion-key="aatrox"
																			data-champion-name-chosung="ㅇㅌㄹㅅ"><a href="#"
																			data-champion-id="266" class="Link">아트록스</a></li>
																		<li class="Item" data-champion-name="아펠리오스"
																			data-champion-key="aphelios"
																			data-champion-name-chosung="ㅇㅍㄹㅇㅅ"><a href="#"
																			data-champion-id="523" class="Link">아펠리오스</a></li>
																		<li class="Item" data-champion-name="알리스타"
																			data-champion-key="alistar"
																			data-champion-name-chosung="ㅇㄹㅅㅌ"><a href="#"
																			data-champion-id="12" class="Link">알리스타</a></li>
																		<li class="Item" data-champion-name="애니"
																			data-champion-key="annie"
																			data-champion-name-chosung="ㅇㄴ"><a href="#"
																			data-champion-id="1" class="Link">애니</a></li>
																		<li class="Item" data-champion-name="애니비아"
																			data-champion-key="anivia"
																			data-champion-name-chosung="ㅇㄴㅂㅇ"><a href="#"
																			data-champion-id="34" class="Link">애니비아</a></li>
																		<li class="Item" data-champion-name="애쉬"
																			data-champion-key="ashe"
																			data-champion-name-chosung="ㅇㅅ"><a href="#"
																			data-champion-id="22" class="Link">애쉬</a></li>
																		<li class="Item" data-champion-name="야스오"
																			data-champion-key="yasuo"
																			data-champion-name-chosung="ㅇㅅㅇ"><a href="#"
																			data-champion-id="157" class="Link">야스오</a></li>
																		<li class="Item" data-champion-name="에코"
																			data-champion-key="ekko"
																			data-champion-name-chosung="ㅇㅋ"><a href="#"
																			data-champion-id="245" class="Link">에코</a></li>
																		<li class="Item" data-champion-name="엘리스"
																			data-champion-key="elise"
																			data-champion-name-chosung="ㅇㄹㅅ"><a href="#"
																			data-champion-id="60" class="Link">엘리스</a></li>
																		<li class="Item" data-champion-name="오공"
																			data-champion-key="monkeyking"
																			data-champion-name-chosung="ㅇㄱ"><a href="#"
																			data-champion-id="62" class="Link">오공</a></li>
																		<li class="Item" data-champion-name="오른"
																			data-champion-key="ornn"
																			data-champion-name-chosung="ㅇㄹ"><a href="#"
																			data-champion-id="516" class="Link">오른</a></li>
																		<li class="Item" data-champion-name="오리아나"
																			data-champion-key="orianna"
																			data-champion-name-chosung="ㅇㄹㅇㄴ"><a href="#"
																			data-champion-id="61" class="Link">오리아나</a></li>
																		<li class="Item" data-champion-name="올라프"
																			data-champion-key="olaf"
																			data-champion-name-chosung="ㅇㄹㅍ"><a href="#"
																			data-champion-id="2" class="Link">올라프</a></li>
																		<li class="Item" data-champion-name="요네"
																			data-champion-key="yone"
																			data-champion-name-chosung="ㅇㄴ"><a href="#"
																			data-champion-id="777" class="Link">요네</a></li>
																		<li class="Item" data-champion-name="요릭"
																			data-champion-key="yorick"
																			data-champion-name-chosung="ㅇㄹ"><a href="#"
																			data-champion-id="83" class="Link">요릭</a></li>
																		<li class="Item" data-champion-name="우디르"
																			data-champion-key="udyr"
																			data-champion-name-chosung="ㅇㄷㄹ"><a href="#"
																			data-champion-id="77" class="Link">우디르</a></li>
																		<li class="Item" data-champion-name="우르곳"
																			data-champion-key="urgot"
																			data-champion-name-chosung="ㅇㄹㄱ"><a href="#"
																			data-champion-id="6" class="Link">우르곳</a></li>
																		<li class="Item" data-champion-name="워윅"
																			data-champion-key="warwick"
																			data-champion-name-chosung="ㅇㅇ"><a href="#"
																			data-champion-id="19" class="Link">워윅</a></li>
																		<li class="Item" data-champion-name="유미"
																			data-champion-key="yuumi"
																			data-champion-name-chosung="ㅇㅁ"><a href="#"
																			data-champion-id="350" class="Link">유미</a></li>
																		<li class="Item" data-champion-name="이렐리아"
																			data-champion-key="irelia"
																			data-champion-name-chosung="ㅇㄹㄹㅇ"><a href="#"
																			data-champion-id="39" class="Link">이렐리아</a></li>
																		<li class="Item" data-champion-name="이블린"
																			data-champion-key="evelynn"
																			data-champion-name-chosung="ㅇㅂㄹ"><a href="#"
																			data-champion-id="28" class="Link">이블린</a></li>
																		<li class="Item" data-champion-name="이즈리얼"
																			data-champion-key="ezreal"
																			data-champion-name-chosung="ㅇㅈㄹㅇ"><a href="#"
																			data-champion-id="81" class="Link">이즈리얼</a></li>
																		<li class="Item" data-champion-name="일라오이"
																			data-champion-key="illaoi"
																			data-champion-name-chosung="ㅇㄹㅇㅇ"><a href="#"
																			data-champion-id="420" class="Link">일라오이</a></li>
																		<li class="Item" data-champion-name="자르반4세"
																			data-champion-key="jarvaniv"
																			data-champion-name-chosung="ㅈㄹㅂ4ㅅ"><a href="#"
																			data-champion-id="59" class="Link">자르반 4세</a></li>
																		<li class="Item" data-champion-name="자야"
																			data-champion-key="xayah"
																			data-champion-name-chosung="ㅈㅇ"><a href="#"
																			data-champion-id="498" class="Link">자야</a></li>
																		<li class="Item" data-champion-name="자이라"
																			data-champion-key="zyra"
																			data-champion-name-chosung="ㅈㅇㄹ"><a href="#"
																			data-champion-id="143" class="Link">자이라</a></li>
																		<li class="Item" data-champion-name="자크"
																			data-champion-key="zac"
																			data-champion-name-chosung="ㅈㅋ"><a href="#"
																			data-champion-id="154" class="Link">자크</a></li>
																		<li class="Item" data-champion-name="잔나"
																			data-champion-key="janna"
																			data-champion-name-chosung="ㅈㄴ"><a href="#"
																			data-champion-id="40" class="Link">잔나</a></li>
																		<li class="Item" data-champion-name="잭스"
																			data-champion-key="jax"
																			data-champion-name-chosung="ㅈㅅ"><a href="#"
																			data-champion-id="24" class="Link">잭스</a></li>
																		<li class="Item" data-champion-name="제드"
																			data-champion-key="zed"
																			data-champion-name-chosung="ㅈㄷ"><a href="#"
																			data-champion-id="238" class="Link">제드</a></li>
																		<li class="Item" data-champion-name="제라스"
																			data-champion-key="xerath"
																			data-champion-name-chosung="ㅈㄹㅅ"><a href="#"
																			data-champion-id="101" class="Link">제라스</a></li>
																		<li class="Item" data-champion-name="제이스"
																			data-champion-key="jayce"
																			data-champion-name-chosung="ㅈㅇㅅ"><a href="#"
																			data-champion-id="126" class="Link">제이스</a></li>
																		<li class="Item" data-champion-name="조이"
																			data-champion-key="zoe"
																			data-champion-name-chosung="ㅈㅇ"><a href="#"
																			data-champion-id="142" class="Link">조이</a></li>
																		<li class="Item" data-champion-name="직스"
																			data-champion-key="ziggs"
																			data-champion-name-chosung="ㅈㅅ"><a href="#"
																			data-champion-id="115" class="Link">직스</a></li>
																		<li class="Item" data-champion-name="진"
																			data-champion-key="jhin"
																			data-champion-name-chosung="ㅈ"><a href="#"
																			data-champion-id="202" class="Link">진</a></li>
																		<li class="Item" data-champion-name="질리언"
																			data-champion-key="zilean"
																			data-champion-name-chosung="ㅈㄹㅇ"><a href="#"
																			data-champion-id="26" class="Link">질리언</a></li>
																		<li class="Item" data-champion-name="징크스"
																			data-champion-key="jinx"
																			data-champion-name-chosung="ㅈㅋㅅ"><a href="#"
																			data-champion-id="222" class="Link">징크스</a></li>
																		<li class="Item" data-champion-name="초가스"
																			data-champion-key="chogath"
																			data-champion-name-chosung="ㅊㄱㅅ"><a href="#"
																			data-champion-id="31" class="Link">초가스</a></li>
																		<li class="Item" data-champion-name="카르마"
																			data-champion-key="karma"
																			data-champion-name-chosung="ㅋㄹㅁ"><a href="#"
																			data-champion-id="43" class="Link">카르마</a></li>
																		<li class="Item" data-champion-name="카밀"
																			data-champion-key="camille"
																			data-champion-name-chosung="ㅋㅁ"><a href="#"
																			data-champion-id="164" class="Link">카밀</a></li>
																		<li class="Item" data-champion-name="카사딘"
																			data-champion-key="kassadin"
																			data-champion-name-chosung="ㅋㅅㄷ"><a href="#"
																			data-champion-id="38" class="Link">카사딘</a></li>
																		<li class="Item" data-champion-name="카서스"
																			data-champion-key="karthus"
																			data-champion-name-chosung="ㅋㅅㅅ"><a href="#"
																			data-champion-id="30" class="Link">카서스</a></li>
																		<li class="Item" data-champion-name="카시오페아"
																			data-champion-key="cassiopeia"
																			data-champion-name-chosung="ㅋㅅㅇㅍㅇ"><a href="#"
																			data-champion-id="69" class="Link">카시오페아</a></li>
																		<li class="Item" data-champion-name="카이사"
																			data-champion-key="kaisa"
																			data-champion-name-chosung="ㅋㅇㅅ"><a href="#"
																			data-champion-id="145" class="Link">카이사</a></li>
																		<li class="Item" data-champion-name="카직스"
																			data-champion-key="khazix"
																			data-champion-name-chosung="ㅋㅈㅅ"><a href="#"
																			data-champion-id="121" class="Link">카직스</a></li>
																		<li class="Item" data-champion-name="카타리나"
																			data-champion-key="katarina"
																			data-champion-name-chosung="ㅋㅌㄹㄴ"><a href="#"
																			data-champion-id="55" class="Link">카타리나</a></li>
																		<li class="Item" data-champion-name="칼리스타"
																			data-champion-key="kalista"
																			data-champion-name-chosung="ㅋㄹㅅㅌ"><a href="#"
																			data-champion-id="429" class="Link">칼리스타</a></li>
																		<li class="Item" data-champion-name="케넨"
																			data-champion-key="kennen"
																			data-champion-name-chosung="ㅋㄴ"><a href="#"
																			data-champion-id="85" class="Link">케넨</a></li>
																		<li class="Item" data-champion-name="케이틀린"
																			data-champion-key="caitlyn"
																			data-champion-name-chosung="ㅋㅇㅌㄹ"><a href="#"
																			data-champion-id="51" class="Link">케이틀린</a></li>
																		<li class="Item" data-champion-name="케인"
																			data-champion-key="kayn"
																			data-champion-name-chosung="ㅋㅇ"><a href="#"
																			data-champion-id="141" class="Link">케인</a></li>
																		<li class="Item" data-champion-name="케일"
																			data-champion-key="kayle"
																			data-champion-name-chosung="ㅋㅇ"><a href="#"
																			data-champion-id="10" class="Link">케일</a></li>
																		<li class="Item" data-champion-name="코그모"
																			data-champion-key="kogmaw"
																			data-champion-name-chosung="ㅋㄱㅁ"><a href="#"
																			data-champion-id="96" class="Link">코그모</a></li>
																		<li class="Item" data-champion-name="코르키"
																			data-champion-key="corki"
																			data-champion-name-chosung="ㅋㄹㅋ"><a href="#"
																			data-champion-id="42" class="Link">코르키</a></li>
																		<li class="Item" data-champion-name="퀸"
																			data-champion-key="quinn"
																			data-champion-name-chosung="ㅋ"><a href="#"
																			data-champion-id="133" class="Link">퀸</a></li>
																		<li class="Item" data-champion-name="클레드"
																			data-champion-key="kled"
																			data-champion-name-chosung="ㅋㄹㄷ"><a href="#"
																			data-champion-id="240" class="Link">클레드</a></li>
																		<li class="Item" data-champion-name="키아나"
																			data-champion-key="qiyana"
																			data-champion-name-chosung="ㅋㅇㄴ"><a href="#"
																			data-champion-id="246" class="Link">키아나</a></li>
																		<li class="Item" data-champion-name="킨드레드"
																			data-champion-key="kindred"
																			data-champion-name-chosung="ㅋㄷㄹㄷ"><a href="#"
																			data-champion-id="203" class="Link">킨드레드</a></li>
																		<li class="Item" data-champion-name="타릭"
																			data-champion-key="taric"
																			data-champion-name-chosung="ㅌㄹ"><a href="#"
																			data-champion-id="44" class="Link">타릭</a></li>
																		<li class="Item" data-champion-name="탈론"
																			data-champion-key="talon"
																			data-champion-name-chosung="ㅌㄹ"><a href="#"
																			data-champion-id="91" class="Link">탈론</a></li>
																		<li class="Item" data-champion-name="탈리야"
																			data-champion-key="taliyah"
																			data-champion-name-chosung="ㅌㄹㅇ"><a href="#"
																			data-champion-id="163" class="Link">탈리야</a></li>
																		<li class="Item" data-champion-name="탐켄치"
																			data-champion-key="tahmkench"
																			data-champion-name-chosung="ㅌㅋㅊ"><a href="#"
																			data-champion-id="223" class="Link">탐 켄치</a></li>
																		<li class="Item" data-champion-name="트런들"
																			data-champion-key="trundle"
																			data-champion-name-chosung="ㅌㄹㄷ"><a href="#"
																			data-champion-id="48" class="Link">트런들</a></li>
																		<li class="Item" data-champion-name="트리스타나"
																			data-champion-key="tristana"
																			data-champion-name-chosung="ㅌㄹㅅㅌㄴ"><a href="#"
																			data-champion-id="18" class="Link">트리스타나</a></li>
																		<li class="Item" data-champion-name="트린다미어"
																			data-champion-key="tryndamere"
																			data-champion-name-chosung="ㅌㄹㄷㅁㅇ"><a href="#"
																			data-champion-id="23" class="Link">트린다미어</a></li>
																		<li class="Item" data-champion-name="트위스티드페이트"
																			data-champion-key="twistedfate"
																			data-champion-name-chosung="ㅌㅇㅅㅌㄷㅍㅇㅌ"><a
																			href="#" data-champion-id="4" class="Link">트위스티드
																				페이트</a></li>
																		<li class="Item" data-champion-name="트위치"
																			data-champion-key="twitch"
																			data-champion-name-chosung="ㅌㅇㅊ"><a href="#"
																			data-champion-id="29" class="Link">트위치</a></li>
																		<li class="Item" data-champion-name="티모"
																			data-champion-key="teemo"
																			data-champion-name-chosung="ㅌㅁ"><a href="#"
																			data-champion-id="17" class="Link">티모</a></li>
																		<li class="Item" data-champion-name="파이크"
																			data-champion-key="pyke"
																			data-champion-name-chosung="ㅍㅇㅋ"><a href="#"
																			data-champion-id="555" class="Link">파이크</a></li>
																		<li class="Item" data-champion-name="판테온"
																			data-champion-key="pantheon"
																			data-champion-name-chosung="ㅍㅌㅇ"><a href="#"
																			data-champion-id="80" class="Link">판테온</a></li>
																		<li class="Item" data-champion-name="피들스틱"
																			data-champion-key="fiddlesticks"
																			data-champion-name-chosung="ㅍㄷㅅㅌ"><a href="#"
																			data-champion-id="9" class="Link">피들스틱</a></li>
																		<li class="Item" data-champion-name="피오라"
																			data-champion-key="fiora"
																			data-champion-name-chosung="ㅍㅇㄹ"><a href="#"
																			data-champion-id="114" class="Link">피오라</a></li>
																		<li class="Item" data-champion-name="피즈"
																			data-champion-key="fizz"
																			data-champion-name-chosung="ㅍㅈ"><a href="#"
																			data-champion-id="105" class="Link">피즈</a></li>
																		<li class="Item" data-champion-name="하이머딩거"
																			data-champion-key="heimerdinger"
																			data-champion-name-chosung="ㅎㅇㅁㄷㄱ"><a href="#"
																			data-champion-id="74" class="Link">하이머딩거</a></li>
																		<li class="Item" data-champion-name="헤카림"
																			data-champion-key="hecarim"
																			data-champion-name-chosung="ㅎㅋㄹ"><a href="#"
																			data-champion-id="120" class="Link">헤카림</a></li>
																		<div class="ChampionNotFound" style="display: none;">
																			<div class="ErrorMessage">챔피언이 존재하지 않습니다.</div>
																		</div>
																	</ul>
																</div>
															</li>
														</ul>
													</div>
												</div>
												<script>
													$(function() {
														$(
																'.SelectMatchChampionList')
																.on(
																		'click',
																		' .ChampionList .Item>a',
																		function(
																				evt) {
																			evt
																					.preventDefault();
																			var $this = $(evt.currentTarget);
																			$.OP.GG.matches.list
																					.changeChampion(
																							$this
																									.data('champion-id'),
																							$this);
																		});
													});
												</script>
											</div>
										</div>
									</div>
								</div>
								<div class="Content">
									<script>
										$(function() {
											$.OP.GG.matches.graph
													.winRatioPieChart(
															'WinRatioGraph-summary',
															11, 9);

											//		if (!(BrowserDetect.browser == 'Explorer' && BrowserDetect.version <= 10)) {
											//			setTimeout(function(){
											//			},100);
											//		}
										});
									</script>
									<div class="GameAverageStatsBox"
										id="GameAverageStatsBox-summary">
										<div class="Box">
											<table class="GameAverageStats">
												<tbody>
													<tr>
														<td class="Title" colspan="2">
															<div class="WinRatioTitle">
																<span class="total">20</span>전 <span class="win">11</span>승
																<span class="lose">9</span>패
															</div>
														</td>
														<td class="MostChampion" rowspan="2">
															<ul>
																<li>
																	<div class="NotFound" style="display: none;">
																		<div class="Image">
																			<i class="__spSite __spSite-88"></i>
																		</div>
																		<div class="Message">챔피언 정보가 없습니다.</div>
																	</div>
																	<div class="Content" style="">
																		<div class="Image">
																			<img
																				src="//opgg-static.akamaized.net/images/lol/champion/Lucian.png?image=q_auto,w_30&amp;v=1596679559"
																				alt="">
																		</div>
																		<div class="Name">루시안</div>
																		<div class="WonLose">
																			<b class="red tip" title="승률">67%</b> (<span
																				class="win">4</span>승 <span class="lose">2</span>패)
																		</div>
																		<div class="KDA green">
																			<span>3.09</span> 평점
																		</div>
																	</div>
																</li>
																<li>
																	<div class="NotFound" style="display: none;">
																		<div class="Image">
																			<i class="__spSite __spSite-88"></i>
																		</div>
																		<div class="Message">챔피언 정보가 없습니다.</div>
																	</div>
																	<div class="Content" style="">
																		<div class="Image">
																			<img
																				src="//opgg-static.akamaized.net/images/lol/champion/Irelia.png?image=q_auto,w_30&amp;v=1596679559"
																				alt="">
																		</div>
																		<div class="Name">이렐리아</div>
																		<div class="WonLose">
																			<b class="red tip" title="승률">67%</b> (<span
																				class="win">2</span>승 <span class="lose">1</span>패)
																		</div>
																		<div class="KDA normal">
																			<span>1.77</span> 평점
																		</div>
																	</div>
																</li>
																<li>
																	<div class="NotFound" style="display: none;">
																		<div class="Image">
																			<i class="__spSite __spSite-88"></i>
																		</div>
																		<div class="Message">챔피언 정보가 없습니다.</div>
																	</div>
																	<div class="Content" style="">
																		<div class="Image">
																			<img
																				src="//opgg-static.akamaized.net/images/lol/champion/Camille.png?image=q_auto,w_30&amp;v=1596679559"
																				alt="">
																		</div>
																		<div class="Name">카밀</div>
																		<div class="WonLose">
																			<b class="tip tpd-delegation-uid-1" title="">50%</b>
																			(<span class="win">1</span>승 <span class="lose">1</span>패)
																		</div>
																		<div class="KDA green">
																			<span>3.88</span> 평점
																		</div>
																	</div>
																</li>
															</ul>
														</td>
														<td class="Title">선호 포지션 (랭크)</td>
													</tr>
													<tr>
														<td class="Summary">
															<div class="WinRatioGraph">
																<div id="WinRatioGraph-summary" class="Graph"
																	style="width: 90px; height: 90px;"
																	data-highcharts-chart="0">
																	<div class="highcharts-container" id="highcharts-0"
																		style="position: relative; overflow: hidden; width: 90px; height: 90px; text-align: left; line-height: normal; z-index: 0; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);">
																		<svg version="1.1"
																			style="font-family: &amp; quot; Lucida Grande&amp;quot; , &amp; quot; Lucida Sans Unicode&amp;quot; , Arial , Helvetica, sans-serif; font-size: 12px;"
																			xmlns="http://www.w3.org/2000/svg" width="90"
																			height="90">
																			<desc>Created with Highcharts 4.2.3</desc>
																			<defs>
																			<clipPath id="highcharts-1">
																			<rect x="0" y="0" width="90" height="90"></rect></clipPath></defs>
																			<g class="highcharts-series-group" zIndex="3">
																			<g class="highcharts-series highcharts-series-0"
																				zIndex="0.1" transform="translate(0,0) scale(1 1)">
																			<path fill="#ee5a52"
																				d="M 44.99083470583372 9.333624220175807e-7 A 45 45 0 0 1 58.93302658756609 87.78867572279114 L 54.907930017824775 75.42750273620703 A 32 32 0 0 0 44.993482457481754 13.00000066372439 Z"
																				stroke-linejoin="round" transform="translate(0,0)"></path>
																			<path fill="#1f8ecd"
																				d="M 58.89023095246203 87.80258735272045 A 45 45 0 1 1 44.93749590278678 0.00004340848947492759 L 44.95555264198171 13.00003086825918 A 32 32 0 1 0 54.877497566195224 75.43739545082343 Z"
																				stroke-linejoin="round" transform="translate(0,0)"></path></g>
																			<g class="highcharts-markers highcharts-series-0"
																				zIndex="0.1" transform="translate(0,0) scale(1 1)"></g></g>
																			<g class="highcharts-tooltip" zIndex="8"
																				style="cursor:default;padding:0;pointer-events:none;white-space:nowrap;"
																				transform="translate(0,-9999)">
																			<path fill="none"
																				d="M 3.5 0.5 L 13.5 0.5 C 16.5 0.5 16.5 0.5 16.5 3.5 L 16.5 13.5 C 16.5 16.5 16.5 16.5 13.5 16.5 L 3.5 16.5 C 0.5 16.5 0.5 16.5 0.5 13.5 L 0.5 3.5 C 0.5 0.5 0.5 0.5 3.5 0.5"
																				isShadow="true" stroke="black"
																				stroke-opacity="0.049999999999999996"
																				stroke-width="5" transform="translate(1, 1)"></path>
																			<path fill="none"
																				d="M 3.5 0.5 L 13.5 0.5 C 16.5 0.5 16.5 0.5 16.5 3.5 L 16.5 13.5 C 16.5 16.5 16.5 16.5 13.5 16.5 L 3.5 16.5 C 0.5 16.5 0.5 16.5 0.5 13.5 L 0.5 3.5 C 0.5 0.5 0.5 0.5 3.5 0.5"
																				isShadow="true" stroke="black"
																				stroke-opacity="0.09999999999999999"
																				stroke-width="3" transform="translate(1, 1)"></path>
																			<path fill="none"
																				d="M 3.5 0.5 L 13.5 0.5 C 16.5 0.5 16.5 0.5 16.5 3.5 L 16.5 13.5 C 16.5 16.5 16.5 16.5 13.5 16.5 L 3.5 16.5 C 0.5 16.5 0.5 16.5 0.5 13.5 L 0.5 3.5 C 0.5 0.5 0.5 0.5 3.5 0.5"
																				isShadow="true" stroke="black" stroke-opacity="0.15"
																				stroke-width="1" transform="translate(1, 1)"></path>
																			<path fill="rgba(249, 249, 249, .85)"
																				d="M 3.5 0.5 L 13.5 0.5 C 16.5 0.5 16.5 0.5 16.5 3.5 L 16.5 13.5 C 16.5 16.5 16.5 16.5 13.5 16.5 L 3.5 16.5 C 0.5 16.5 0.5 16.5 0.5 13.5 L 0.5 3.5 C 0.5 0.5 0.5 0.5 3.5 0.5"></path>
																			<text x="8" zIndex="1"
																				style="font-size:12px;color:#333333;fill:#333333;"
																				y="20"></text></g></svg>
																	</div>
																</div>
																<div class="Text">55%</div>
															</div>
														</td>
														<td class="KDA">
															<div class="KDA">
																<span class="Kill">6.2</span> / <span class="Death">3.8</span>
																/ <span class="Assist">7.7</span>
															</div>
															<div class="KDARatio">
																<span class="KDARatio">3.69:1</span> <span
																	class="CKRate tip" title="킬관여율">(<span>56%</span>)
																</span>
															</div>
														</td>
														<td class="PositionStats">
															<ul class="Content" style="">
																<li style="">
																	<div class="Image">
																		<i class="__spSite __spSite-147"></i>
																	</div>
																	<div class="PositionStatContent">
																		<div class="Name">탑</div>
																		<span class="RoleRate"><b>40</b>%</span> <span
																			class="WinRatio">승률 <span><b>63</b>%</span></span>
																	</div>
																</li>
																<li style="">
																	<div class="Image">
																		<i class="__spSite __spSite-143"></i>
																	</div>
																	<div class="PositionStatContent">
																		<div class="Name">미드</div>
																		<span class="RoleRate"><b>40</b>%</span> <span
																			class="WinRatio">승률 <span><b>38</b>%</span></span>
																	</div>
																</li>
																<li style="display: none;">
																	<div class="Image">
																		<i></i>
																	</div>
																	<div class="PositionStatContent">
																		<div class="Name">?</div>
																		<span class="RoleRate"><b>?</b>%</span> <span
																			class="WinRatio">승률 <span><b>?</b>%</span></span>
																	</div>
																</li>
															</ul>
															<ul class="NotFound" style="display: none;">
																<li>
																	<div class="Image">
																		<i class="__spSite __spSite-149"></i>
																	</div>
																	<div class="PositionStatContent">
																		<div class="Message">포지션 정보가 없습니다.</div>
																	</div>
																</li>
															</ul>
														</td>
													</tr>
												</tbody>
											</table>
										</div>
										<div class="Message">
											최근 <span>20</span>게임 데이터 분석
										</div>
										<button
											onclick="$.OP.GG.matches.average.toggle($('#GameAverageStatsBox-summary'))">
											<span class="On"> <img class="Default"
												src="//opgg-static.akamaized.net/images/site/summoner/btn-ovshow-n.png"
												alt=""> <img class="Hover"
												src="//opgg-static.akamaized.net/images/site/summoner/btn-ovshow-p.png"
												alt="">
											</span> <span class="Off"> <img class="Default"
												src="//opgg-static.akamaized.net/images/site/summoner/btn-ovhide-n.png"
												alt=""> <img class="Hover"
												src="//opgg-static.akamaized.net/images/site/summoner/btn-ovhide-p.png"
												alt="">
											</span>
										</button>
									</div>
									<div class="opscore-banner">
										<div class="opscore-banner__header">
											<div class="opscore-banner__wrapper">
												OP스코어로 더 정확한 내 실력을 확인해 보세요
												<div class="opscore-banner__wrapper--badge">Beta</div>
											</div>
											<div class="opscore-banner__header--button hide">
												<img
													class="opscore-banner__header--button-icon opscore-banner__header--button-icon-spin"
													src="//opgg-static.akamaized.net/icon/icon-viewdetail-beta-down@2x.png">
											</div>
										</div>
										<div class="opscore-banner__content hide">
											<div class="opscore-banner__content-title">OP스코어란?</div>
											<div class="opscore-banner__content-description">역할군과
												라인전, 킬/데스/데미지/시야장악/오브젝트 파괴 등의 지표를 종합해 게임 내 활약 정도를 측정하는 평점
												시스템입니다.</div>
											<br>
											<div class="opscore-banner__content-detail">
												<div class="opscore-banner__content-best-player">
													<div class="opscore-banner__content-title">베스트 플레이어
														선정</div>
													<div class="opscore-banner__content-row">
														<div class="opscore-banner__content-badge MVP">MVP</div>
														<div class="opscore-banner__content-badge-description MVP">
															해당 경기에서 가장 뛰어난 활약을 보여준 1명</div>
													</div>
													<div class="opscore-banner__content-row">
														<div class="opscore-banner__content-badge ACE">ACE</div>
														<div class="opscore-banner__content-badge-description ACE">
															팀은 비록 패배했지만 승리팀 못지 않은 활약을 보여준 1명</div>
													</div>
												</div>
												<div class="opscore-banner__content-score-area">
													<div class="opscore-banner__content-title">
														평점 구간 <img class="opscore-banner__guide-icon tip"
															src="//opgg-static.akamaized.net/icon/icon-guide@2x.png"
															title="평점은 0~10점을 기준으로 경기에 기여한 정도에 따라 차등 부여됩니다. 탈주 등 패배에 결정적인 영향을 끼친 경우 0점에 가까운 점수가 부여됩니다."
															alt="OPScoreDecsription">
													</div>
													<div class="opscore-banner__content-graph">
														<div class="opscore-area__graph"></div>
														<div class="opscore-area__graph-score">
															<div>0</div>
															<div>10</div>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="opscore-banner__footer hide">OP스코어는 현재 베타
											테스트 기간으로, 각 게임의 특성에 따라 다소 부정확한 결과가 노출될 수 있습니다. 각각의 지표 또는 가중치를
											지속적으로 조정해 가장 객관적인 지표를 찾기 위해 개선해갈 예정이니 많은 관심과 의견 부탁드립니다.</div>
									</div>
									<script>
										(function() {
											var headerButton = document
													.querySelector(".opscore-banner__header--button");
											var headerButtonIcon = document
													.querySelector(".opscore-banner__header--button-icon");
											var content = document
													.querySelector(".opscore-banner__content");
											var footer = document
													.querySelector(".opscore-banner__footer");
											var spinClassName = "opscore-banner__header--button-icon-spin";

											headerButton.onclick = function() {
												headerButtonIcon.classList
														.toggle(spinClassName);
												content.classList
														.toggle("hide");
												footer.classList.toggle("hide");
											}
										})();
									</script>
									<div class="GameItemList">
										<div class="GameItemWrap">
											<div class="GameItem Win  " data-summoner-id="4460427"
												data-game-time="1599500252" data-game-id="4631234474"
												data-game-result="win">
												<div class="Content">
													<div class="GameStats">
														<div class="GameType" title="솔랭">솔랭</div>
														<div class="TimeStamp">
															<span
																class="_timeago _timeCountAssigned tip tpd-delegation-uid-1"
																data-datetime="1599500252" data-type=""
																data-interval="60" title="2020년 9월 8일 오전 3시 00분">7시간
																전</span>
														</div>
														<div class="Bar"></div>
														<div class="GameResult">승리</div>
														<div class="GameLength">24분 17초</div>

													</div>
													<div class="GameSettingInfo">
														<div class="ChampionImage">
															<a href="/champion/irelia/statistics" target="_blank"><img
																src="//opgg-static.akamaized.net/images/lol/champion/Irelia.png?image=q_auto,w_46&amp;v=1596679559"
																class="Image" alt="이렐리아"></a>
														</div>

														<div class="SummonerSpell">
															<div class="Spell">
																<img
																	src="//opgg-static.akamaized.net/images/lol/spell/SummonerTeleport.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip tpd-delegation-uid-1" title=""
																	alt="순간이동">
															</div>
															<div class="Spell">
																<img
																	src="//opgg-static.akamaized.net/images/lol/spell/SummonerFlash.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip tpd-delegation-uid-1" title=""
																	alt="점멸">
															</div>
														</div>
														<div class="Runes">
															<div class="Rune">
																<img
																	src="//opgg-static.akamaized.net/images/lol/perk/8005.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #ffc659'>집중 공격</b><br><span>적 챔피언에게 연속으로 3회 기본 공격을 가하면 레벨에 따라 40 ~ 180의 추가 <lol-uikit-tooltipped-keyword key='LinkTooltip_Description_AdaptiveDmg'><font color='#48C4B7'>적응형 피해</font></lol-uikit-tooltipped-keyword>를 입히고 적의 약점을 노출시킵니다. 약점이 노출된 적은 6초 동안 모든 상대에게서 8 ~ 12%의 추가 피해를 받습니다.</span>"
																	alt="집중 공격">
															</div>
															<div class="Rune">
																<img
																	src="//opgg-static.akamaized.net/images/lol/perkStyle/8300.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #ffc659'>영감</b><br><span>다양한 방식의 전투 보조</span>"
																	alt="영감">
															</div>
														</div>
														<div class="ChampionName">
															<a href="/champion/irelia/statistics" target="_blank">이렐리아</a>
														</div>
													</div>
													<div class="KDA">
														<div class="KDA">
															<span class="Kill">5</span> / <span class="Death">5</span>
															/ <span class="Assist">6</span>
														</div>
														<div class="KDARatio">
															<span class="KDARatio ">2.20:1</span> 평점
														</div>
													</div>
													<div class="Stats">
														<div class="Level">레벨15</div>
														<div class="CS">
															<span class="CS tip"
																title="미니언 175  + 몬스터 10<br>분당CS 7.6개">185 (7.6)</span>
															CS
														</div>
														<div class="CKRate tip" title="킬관여율">킬관여 38%</div>
														<div class="MMR">
															<span>매치 평균</span> <br> <b>Grandmaster</b>
														</div>
													</div>
													<div class="Items">
														<div class="ItemList">
															<div class="Item">
																<img
																	src="//opgg-static.akamaized.net/images/lol/item/3153.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip tpd-delegation-uid-1" title=""
																	alt="몰락한 왕의 검">
															</div>
															<div class="Item">
																<img
																	src="//opgg-static.akamaized.net/images/lol/item/2033.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #00cfbc'>부패 물약</b><br><span>체력과 마나가 일정 시간 동안 회복되고 전투 능력을 상승시킵니다. 상점에 가면 다시 충전됩니다.</span><br><span><groupLimit>한 번에 한 종류의 회복 물약만 소지할 수 있습니다.</groupLimit><br><br><active>고유 사용 효과:</active> 충전량을 1회 소모해 12초 동안 125의 체력과 75의 마나를 회복하고, 그 동안 <font color='#FF8811'><u>부패의 손길</u></font>을 활성화합니다. 상점 방문 시 3회의 충전량이 다시 채워집니다.<br><br><font color='#FF8811'><u>부패의 손길:</u></font> 적 챔피언에게 주문 및 공격으로 피해를 입히면 적을 불태워 3초 동안 15의 마법 피해를 입힙니다. (광역 및 지속 피해 스킬 사용 시에는 피해의 50%만 적용됩니다. 피해량은 챔피언 레벨에 비례해 증가합니다.)<br><br><rules>(부패 물약은 체력과 마나가 모두 차 있을 때도 사용할 수 있습니다.)</rules></span><br><span>가격:</span> <span style='color: #ffc659'>500 (350)</span>"
																	alt="부패 물약">
															</div>
															<div class="Item">
																<img
																	src="//opgg-static.akamaized.net/images/lol/item/3047.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #00cfbc'>닌자의 신발</b><br><span>이동 속도가 증가하고, 적에게 받는 기본 공격의 피해가 줄어듭니다.</span><br><span><groupLimit>1개만 구입 가능합니다.</groupLimit><br><br><stats>방어력 +20</stats><br><br><unique>고유 지속 효과:</unique> 기본 공격 피해량의 12%를 막아 줍니다.<br><unique>고유 지속 효과 - 이동 속도 향상:</unique> 이동 속도 +45</span><br><span>가격:</span> <span style='color: #ffc659'>1100 (500)</span>"
																	alt="닌자의 신발">
															</div>
															<div class="Item">
																<img
																	src="//opgg-static.akamaized.net/images/lol/item/3363.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #00cfbc'>망원형 개조</b><br><span>설치 범위가 증가하며 대상 지역을 드러내 줍니다.</span><br><span><levelLimit>업그레이드하려면 9레벨 이상이 되어야 합니다.</levelLimit><br><groupLimit>장신구 소지 개수는 1개로 제한됩니다.</groupLimit><br><br><font color='#FFFFFF'>와드 토템</font> 장신구 업그레이드 시:<br><br><stats><font color='#00FF00'>+</font> 설치 가능 범위 대폭(+650%) 증가<br><font color='#00FF00'>+</font> 지속시간 제한 없음, 와드 설치 개수 제한에 관계 없음<br><font color='#FF0000'>-</font> <font color='#FF6600'>재사용 대기시간 10% 증가</font><br><font color='#FF0000'>-</font> <font color='#FF6600'>누구나 볼 수 있는 와드로, 파괴 가능하고 아군의 대상으로 지정 불가</font><br><font color='#FF0000'>-</font> <font color='#FF6600'>와드 시야 범위 45% 감소</font><br><font color='#FF0000'>-</font> <font color='#FF6600'>상점 방문 시 충전되지 않음</font></stats></span>"
																	alt="망원형 개조">
															</div>
															<div class="Item">
																<img
																	src="//opgg-static.akamaized.net/images/lol/item/3071.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip tpd-delegation-uid-1" title=""
																	alt="칠흑의 양날 도끼">
															</div>
															<div class="Item">
																<img
																	src="//opgg-static.akamaized.net/images/lol/item/1036.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #00cfbc'>롱소드</b><br><span>공격력이 약간 증가합니다.</span><br><span><stats>공격력 +10</stats></span><br><span>가격:</span> <span style='color: #ffc659'>350 (350)</span>"
																	alt="롱소드">
															</div>
															<div class="Item">
																<img
																	src="//opgg-static.akamaized.net/images/lol/item/3105.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #00cfbc'>군단의 방패</b><br><span>방어력과 마법 저항력이 증가합니다.</span><br><span><stats>방어력 +30<br>마법 저항력 +30</stats></span><br><span>가격:</span> <span style='color: #ffc659'>1100 (350)</span>"
																	alt="군단의 방패">
															</div>
															<button class="Button OpenBuildButton tip" title="빌드"
																type="button">
																<img class="On"
																	src="//opgg-static.akamaized.net/css3/sprite/images/icon-buildblue-p.png">
																<img class="Off"
																	src="//opgg-static.akamaized.net/css3/sprite/images/icon-buildblue-p.png">
															</button>
														</div>
														<div class="Trinket">
															<img
																src="//opgg-static.akamaized.net/images/site/summoner/icon-ward-blue.png">
															제어 와드 <span class="wards vision">3</span>
														</div>
													</div>
													<div class="FollowPlayers Names">
														<div class="Team">
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-71 tip"
																		title="마오카이">마오카이</div>
																	<div class="Image20 __sprite __spc20 __spc20-71 tip"
																		title="마오카이">마오카이</div>
																</div>
																<div class="SummonerName">
																	<a href="//www.op.gg/summoner/userName=KTA+Top"
																		class="Link" target="_blank">KTA Top</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-104 tip"
																		title="쉔">쉔</div>
																	<div class="Image20 __sprite __spc20 __spc20-104 tip"
																		title="쉔">쉔</div>
																</div>
																<div class="SummonerName">
																	<a
																		href="//www.op.gg/summoner/userName=tuixinloituinoob"
																		class="Link" target="_blank">tuixinloituinoob</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-66 tip"
																		title="루시안">루시안</div>
																	<div class="Image20 __sprite __spc20 __spc20-66 tip"
																		title="루시안">루시안</div>
																</div>
																<div class="SummonerName">
																	<a href="//www.op.gg/summoner/userName=qwerfdlp"
																		class="Link" target="_blank">qwerfdlp</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-27 tip"
																		title="이즈리얼">이즈리얼</div>
																	<div class="Image20 __sprite __spc20 __spc20-27 tip"
																		title="이즈리얼">이즈리얼</div>
																</div>
																<div class="SummonerName">
																	<a href="//www.op.gg/summoner/userName=Lumen+AD"
																		class="Link" target="_blank">Lumen AD</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-67 tip"
																		title="룰루">룰루</div>
																	<div class="Image20 __sprite __spc20 __spc20-67 tip"
																		title="룰루">룰루</div>
																</div>
																<div class="SummonerName">
																	<a href="//www.op.gg/summoner/userName=oxoq"
																		class="Link" target="_blank">oxoq</a>
																</div>
															</div>
														</div>
														<div class="Team">
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-45 tip"
																		title="제이스">제이스</div>
																	<div class="Image20 __sprite __spc20 __spc20-45 tip"
																		title="제이스">제이스</div>
																</div>
																<div class="SummonerName">
																	<a href="//www.op.gg/summoner/userName=Jianguoqiang"
																		class="Link" target="_blank">Jianguoqiang</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-113 tip"
																		title="사일러스">사일러스</div>
																	<div class="Image20 __sprite __spc20 __spc20-113 tip"
																		title="사일러스">사일러스</div>
																</div>
																<div class="SummonerName">
																	<a href="//www.op.gg/summoner/userName=beer124"
																		class="Link" target="_blank">beer124</a>
																</div>
															</div>
															<div class="Summoner Requester">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-40 tip"
																		title="이렐리아">이렐리아</div>
																	<div class="Image20 __sprite __spc20 __spc20-40 tip"
																		title="이렐리아">이렐리아</div>
																</div>
																<div class="SummonerName">
																	<a href="//www.op.gg/summoner/userName=Hide+on+bush"
																		class="Link" target="_blank">Hide on bush</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-15 tip"
																		title="케이틀린">케이틀린</div>
																	<div class="Image20 __sprite __spc20 __spc20-15 tip"
																		title="케이틀린">케이틀린</div>
																</div>
																<div class="SummonerName">
																	<a href="//www.op.gg/summoner/userName=XXXTENTACION"
																		class="Link" target="_blank">XXXTENTACION</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div
																		class="Image16 __sprite __spc16 __spc16-89 tip tpd-delegation-uid-1"
																		title="">파이크</div>
																	<div class="Image20 __sprite __spc20 __spc20-89 tip"
																		title="파이크">파이크</div>
																</div>
																<div class="SummonerName">
																	<a href="//www.op.gg/summoner/userName=Black++linfeng"
																		class="Link" target="_blank">Black linfeng</a>
																</div>
															</div>
														</div>
													</div>
													<div class="StatsButton">
														<div class="Content">
															<div class="Item">
																<a id="right_match_replay" href="#"
																	class="Button Replay OpenSpectateButton"> <span
																	class="__spSite __spSite-159"></span></a>
															</div>
															<div class="Item">
																<a id="right_match" href="#" class="Button MatchDetail">
																	<span class="__spSite __spSite-194 Off"></span> <span
																	class="__spSite __spSite-193 On"></span>
																</a>
															</div>
														</div>
													</div>
												</div>
												<div class="GameDetail"></div>
											</div>
										</div>
										<div class="GameItemWrap">
											<div class="GameItem Win  " data-summoner-id="4460427"
												data-game-time="1599497888" data-game-id="4631270751"
												data-game-result="win">
												<div class="Content">
													<div class="GameStats">
														<div class="GameType" title="솔랭">솔랭</div>
														<div class="TimeStamp">
															<span class="_timeago _timeCountAssigned tip"
																data-datetime="1599497888" data-type=""
																data-interval="60" title="2020년 9월 8일 오전 2시 20분">7시간
																전</span>
														</div>
														<div class="Bar"></div>
														<div class="GameResult">승리</div>
														<div class="GameLength">18분 43초</div>

													</div>
													<div class="GameSettingInfo">
														<div class="ChampionImage">
															<a href="/champion/camille/statistics" target="_blank"><img
																src="//opgg-static.akamaized.net/images/lol/champion/Camille.png?image=q_auto,w_46&amp;v=1596679559"
																class="Image" alt="카밀"></a>
														</div>

														<div class="SummonerSpell">
															<div class="Spell">
																<img
																	src="//opgg-static.akamaized.net/images/lol/spell/SummonerTeleport.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #ffc659'>순간이동</b><br><span>4초 동안 정신을 집중한 다음, 챔피언이 지정한 아군 구조물, 미니언, 혹은 와드로 순간이동하고 이동 속도가 증가합니다. 순간이동의 재사용 대기시간은 챔피언 레벨에 따라 420~240초입니다.</span>"
																	alt="순간이동">
															</div>
															<div class="Spell">
																<img
																	src="//opgg-static.akamaized.net/images/lol/spell/SummonerFlash.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #ffc659'>점멸</b><br><span>커서 방향으로 챔피언이 짧은 거리를 순간이동합니다.</span>"
																	alt="점멸">
															</div>
														</div>
														<div class="Runes">
															<div class="Rune">
																<img
																	src="//opgg-static.akamaized.net/images/lol/perk/8021.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #ffc659'>기민한 발놀림</b><br><span>공격 또는 이동 시 충전 중첩이 쌓입니다. 중첩이 100회 쌓이면 충전 상태로 다음 공격을 할 수 있습니다.<br><br>충전 상태로 공격 시 3~60(+추가 공격력의 0.3, +주문력의 0.3)에 해당하는 체력이 회복되며 1초 동안 이동 속도가 20% 증가합니다.<br><br>원거리 챔피언의 경우 미니언으로부터 받는 회복 효과가 20%만 적용됩니다.</span>"
																	alt="기민한 발놀림">
															</div>
															<div class="Rune">
																<img
																	src="//opgg-static.akamaized.net/images/lol/perkStyle/8300.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #ffc659'>영감</b><br><span>다양한 방식의 전투 보조</span>"
																	alt="영감">
															</div>
														</div>
														<div class="ChampionName">
															<a href="/champion/camille/statistics" target="_blank">카밀</a>
														</div>
													</div>
													<div class="KDA">
														<div class="KDA">
															<span class="Kill">9</span> / <span class="Death">1</span>
															/ <span class="Assist">5</span>
														</div>
														<div class="KDARatio">
															<span class="KDARatio ">14.00:1</span> 평점
														</div>
														<div class="Badge">
															<span class="Text MVP">MVP</span>
														</div>
													</div>
													<div class="Stats">
														<div class="Level">레벨14</div>
														<div class="CS">
															<span class="CS tip tpd-delegation-uid-1" title="">174
																(9.3)</span> CS
														</div>
														<div class="CKRate tip tpd-delegation-uid-1" title="">
															킬관여 70%</div>
														<div class="MMR">
															<span>매치 평균</span> <br> <b>Grandmaster</b>
														</div>
													</div>
													<div class="Items">
														<div class="ItemList">
															<div class="Item">
																<img
																	src="//opgg-static.akamaized.net/images/lol/item/3077.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip tpd-delegation-uid-1" title=""
																	alt="티아맷">
															</div>
															<div class="Item">
																<img
																	src="//opgg-static.akamaized.net/images/lol/item/2031.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip tpd-delegation-uid-1" title=""
																	alt="충전형 물약">
															</div>
															<div class="Item">
																<img
																	src="//opgg-static.akamaized.net/images/lol/item/3158.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #00cfbc'>명석함의 아이오니아 장화</b><br><span>이동 속도와 재사용 대기시간 감소율이 증가합니다.</span><br><span><groupLimit>1개만 구입 가능합니다.</groupLimit><br><br><unique>고유 지속 효과:</unique> 재사용 대기시간 감소 +10%<br><unique>고유 지속 효과 - 이동 속도 향상:</unique> 이동 속도 +45<br><unique>고유 지속 효과:</unique> 소환사 주문의 재사용 대기시간을 10%만큼 줄입니다.<br><br><br><rules><font color='#FDD017'>CLE 20년 12월 10일 남부 지방의 패권을 두고 벌어진 녹서스와의 재경합에서 아이오니아의 승리를 기념하는 헌정 아이템입니다.''</font></rules></span><br><span>가격:</span> <span style='color: #ffc659'>900 (600)</span>"
																	alt="명석함의 아이오니아 장화">
															</div>
															<div class="Item">
																<img
																	src="//opgg-static.akamaized.net/images/lol/item/3340.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #00cfbc'>와드 토템 (장신구)</b><br><span>주기적으로 투명 와드를 설치합니다.</span><br><span><groupLimit>장신구 소지 개수는 1개로 제한됩니다.</groupLimit><br><br><active>사용 시:</active> 충전량을 1회 소모하여 <scaleLevel>90 ~ 120</scaleLevel>초 동안 주변을 드러내 주는 보이지 않는 <font color='#BBFFFF'>투명 와드</font>를 설치합니다. <br><br>매 <scaleLevel>240 ~ 120</scaleLevel>초마다 1회 충전되며 최대 2회까지 충전됩니다.<br><br>와드 지속시간과 충전 주기는 레벨이 오를수록 향상됩니다.<br><br><rules>(플레이어당 맵에 설치할 수 있는 <font color='#BBFFFF'>투명 와드</font>는 3개로 제한됩니다.)</rules></span>"
																	alt="와드 토템 (장신구)">
															</div>
															<div class="Item">
																<img
																	src="//opgg-static.akamaized.net/images/lol/item/3105.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #00cfbc'>군단의 방패</b><br><span>방어력과 마법 저항력이 증가합니다.</span><br><span><stats>방어력 +30<br>마법 저항력 +30</stats></span><br><span>가격:</span> <span style='color: #ffc659'>1100 (350)</span>"
																	alt="군단의 방패">
															</div>
															<div class="Item">
																<img
																	src="//opgg-static.akamaized.net/images/lol/item/3078.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #00cfbc'>삼위일체</b><br><span>취급주의: 이 아이템만 갖추면 '엄청난 피해'를 줄 수 있죠...</span><br><span><stats>체력 +250<br><mana>마나 +250</mana><br>공격력 +25<br>공격 속도 +40%<br>재사용 대기시간 감소 +20%<br>이동 속도 +5%</stats><br><br><unique>고유 지속 효과 - 격분:</unique> 기본 공격 시 2초간 이동 속도가 20 상승합니다. 적을 처치하면 이동 속도가 60 상승합니다. 원거리 챔피언의 경우 이동 속도 상승 효과는 절반만 적용됩니다.<br><unique>고유 지속 효과 - 주문 검:</unique> 스킬을 사용하고 나면 다음 기본 공격 적중 시 기본 공격력의 200%에 해당하는 추가 물리 피해를 입힙니다. (재사용 대기시간 1.5초)</span><br><span>가격:</span> <span style='color: #ffc659'>3733 (333)</span>"
																	alt="삼위일체">
															</div>
															<div class="Item">
																<img
																	src="//opgg-static.akamaized.net/images/lol/item/3133.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #00cfbc'>콜필드의 전투 망치</b><br><span>공격력과 재사용 대기시간 감소율이 증가합니다.</span><br><span><stats>공격력 +25</stats><br><br><unique>고유 지속 효과:</unique> 재사용 대기시간 감소 +10%</span><br><span>가격:</span> <span style='color: #ffc659'>1100 (400)</span>"
																	alt="콜필드의 전투 망치">
															</div>
															<button class="Button OpenBuildButton tip" title="빌드"
																type="button">
																<img class="On"
																	src="//opgg-static.akamaized.net/css3/sprite/images/icon-buildblue-p.png">
																<img class="Off"
																	src="//opgg-static.akamaized.net/css3/sprite/images/icon-buildblue-p.png">
															</button>
														</div>
														<div class="Trinket">
															<img
																src="//opgg-static.akamaized.net/images/site/summoner/icon-ward-blue.png">
															제어 와드 <span class="wards vision">2</span>
														</div>
													</div>
													<div class="FollowPlayers Names">
														<div class="Team">
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-40 tip"
																		title="이렐리아">이렐리아</div>
																	<div class="Image20 __sprite __spc20 __spc20-40 tip"
																		title="이렐리아">이렐리아</div>
																</div>
																<div class="SummonerName">
																	<a href="//www.op.gg/summoner/userName=dansawangzhe"
																		class="Link" target="_blank">dansawangzhe</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-43 tip"
																		title="자르반 4세">자르반 4세</div>
																	<div class="Image20 __sprite __spc20 __spc20-43 tip"
																		title="자르반 4세">자르반 4세</div>
																</div>
																<div class="SummonerName">
																	<a
																		href="//www.op.gg/summoner/userName=%EA%B9%80%ED%83%9C%ED%9B%88%EC%A0%9C%EB%8B%AD%EB%8B%A4%EB%A6%AC"
																		class="Link" target="_blank">김태훈제닭다리</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-85 tip"
																		title="오리아나">오리아나</div>
																	<div class="Image20 __sprite __spc20 __spc20-85 tip"
																		title="오리아나">오리아나</div>
																</div>
																<div class="SummonerName">
																	<a
																		href="//www.op.gg/summoner/userName=%EB%94%B1%EB%94%B0%EA%B5%AC%EB%A6%AC%EB%B6%80%EB%A6%AC%EB%B0%95%EA%B8%B0"
																		class="Link" target="_blank">딱따구리부리박기</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-46 tip"
																		title="진">진</div>
																	<div class="Image20 __sprite __spc20 __spc20-46 tip"
																		title="진">진</div>
																</div>
																<div class="SummonerName">
																	<a href="//www.op.gg/summoner/userName=KTA+ADC"
																		class="Link" target="_blank">KTA ADC</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-79 tip"
																		title="노틸러스">노틸러스</div>
																	<div class="Image20 __sprite __spc20 __spc20-79 tip"
																		title="노틸러스">노틸러스</div>
																</div>
																<div class="SummonerName">
																	<a
																		href="//www.op.gg/summoner/userName=%EC%86%90%EC%8B%9C%EC%9A%B0%EB%B6%84%EC%8B%A0"
																		class="Link" target="_blank">손시우분신</a>
																</div>
															</div>
														</div>
														<div class="Team">
															<div class="Summoner Requester">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-16 tip"
																		title="카밀">카밀</div>
																	<div class="Image20 __sprite __spc20 __spc20-16 tip"
																		title="카밀">카밀</div>
																</div>
																<div class="SummonerName">
																	<a href="//www.op.gg/summoner/userName=Hide+on+bush"
																		class="Link" target="_blank">Hide on bush</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-113 tip"
																		title="사일러스">사일러스</div>
																	<div class="Image20 __sprite __spc20 __spc20-113 tip"
																		title="사일러스">사일러스</div>
																</div>
																<div class="SummonerName">
																	<a href="//www.op.gg/summoner/userName=Nuguri+jjayo"
																		class="Link" target="_blank">Nuguri jjayo</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div
																		class="Image16 __sprite __spc16 __spc16-2 tip tpd-delegation-uid-1"
																		title="">아칼리</div>
																	<div class="Image20 __sprite __spc20 __spc20-2 tip"
																		title="아칼리">아칼리</div>
																</div>
																<div class="SummonerName">
																	<a href="//www.op.gg/summoner/userName=LaP1s+"
																		class="Link" target="_blank">LaP1s </a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-8 tip"
																		title="애쉬">애쉬</div>
																	<div class="Image20 __sprite __spc20 __spc20-8 tip"
																		title="애쉬">애쉬</div>
																</div>
																<div class="SummonerName">
																	<a href="//www.op.gg/summoner/userName=Teddy12345"
																		class="Link" target="_blank">Teddy12345</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-87 tip"
																		title="판테온">판테온</div>
																	<div class="Image20 __sprite __spc20 __spc20-87 tip"
																		title="판테온">판테온</div>
																</div>
																<div class="SummonerName">
																	<a
																		href="//www.op.gg/summoner/userName=%EC%BF%A0+%EB%A6%AC"
																		class="Link" target="_blank">쿠 리</a>
																</div>
															</div>
														</div>
													</div>
													<div class="StatsButton">
														<div class="Content">
															<div class="Item">
																<a id="right_match_replay" href="#"
																	class="Button Replay OpenSpectateButton"> <span
																	class="__spSite __spSite-159"></span></a>
															</div>
															<div class="Item">
																<a id="right_match" href="#" class="Button MatchDetail">
																	<span class="__spSite __spSite-194 Off"></span> <span
																	class="__spSite __spSite-193 On"></span>
																</a>
															</div>
														</div>
													</div>
												</div>
												<div class="GameDetail"></div>
											</div>
										</div>
										<div class="GameItemWrap">
											<div class="GameItem Lose  " data-summoner-id="4460427"
												data-game-time="1599496009" data-game-id="4631136276"
												data-game-result="lose">
												<div class="Content">
													<div class="GameStats">
														<div class="GameType" title="솔랭">솔랭</div>
														<div class="TimeStamp">
															<span
																class="_timeago _timeCountAssigned tip tpd-delegation-uid-1"
																data-datetime="1599496009" data-type=""
																data-interval="60" title="2020년 9월 8일 오전 1시 49분">8시간
																전</span>
														</div>
														<div class="Bar"></div>
														<div class="GameResult">패배</div>
														<div class="GameLength">25분 4초</div>

													</div>
													<div class="GameSettingInfo">
														<div class="ChampionImage">
															<a href="/champion/camille/statistics" target="_blank"><img
																src="//opgg-static.akamaized.net/images/lol/champion/Camille.png?image=q_auto,w_46&amp;v=1596679559"
																class="Image" alt="카밀"></a>
														</div>

														<div class="SummonerSpell">
															<div class="Spell">
																<img
																	src="//opgg-static.akamaized.net/images/lol/spell/SummonerTeleport.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #ffc659'>순간이동</b><br><span>4초 동안 정신을 집중한 다음, 챔피언이 지정한 아군 구조물, 미니언, 혹은 와드로 순간이동하고 이동 속도가 증가합니다. 순간이동의 재사용 대기시간은 챔피언 레벨에 따라 420~240초입니다.</span>"
																	alt="순간이동">
															</div>
															<div class="Spell">
																<img
																	src="//opgg-static.akamaized.net/images/lol/spell/SummonerFlash.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #ffc659'>점멸</b><br><span>커서 방향으로 챔피언이 짧은 거리를 순간이동합니다.</span>"
																	alt="점멸">
															</div>
														</div>
														<div class="Runes">
															<div class="Rune">
																<img
																	src="//opgg-static.akamaized.net/images/lol/perk/8021.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #ffc659'>기민한 발놀림</b><br><span>공격 또는 이동 시 충전 중첩이 쌓입니다. 중첩이 100회 쌓이면 충전 상태로 다음 공격을 할 수 있습니다.<br><br>충전 상태로 공격 시 3~60(+추가 공격력의 0.3, +주문력의 0.3)에 해당하는 체력이 회복되며 1초 동안 이동 속도가 20% 증가합니다.<br><br>원거리 챔피언의 경우 미니언으로부터 받는 회복 효과가 20%만 적용됩니다.</span>"
																	alt="기민한 발놀림">
															</div>
															<div class="Rune">
																<img
																	src="//opgg-static.akamaized.net/images/lol/perkStyle/8300.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #ffc659'>영감</b><br><span>다양한 방식의 전투 보조</span>"
																	alt="영감">
															</div>
														</div>
														<div class="ChampionName">
															<a href="/champion/camille/statistics" target="_blank">카밀</a>
														</div>
													</div>
													<div class="KDA">
														<div class="KDA">
															<span class="Kill">4</span> / <span class="Death">7</span>
															/ <span class="Assist">13</span>
														</div>
														<div class="KDARatio">
															<span class="KDARatio ">2.43:1</span> 평점
														</div>
														<div class="Badge">
															<span class="Text ACE">ACE</span>
														</div>
													</div>
													<div class="Stats">
														<div class="Level">레벨14</div>
														<div class="CS">
															<span class="CS tip"
																title="미니언 157  + 몬스터 16<br>분당CS 6.9개">173 (6.9)</span>
															CS
														</div>
														<div class="CKRate tip tpd-delegation-uid-1" title="">
															킬관여 61%</div>
														<div class="MMR">
															<span>매치 평균</span> <br> <b>Grandmaster</b>
														</div>
													</div>
													<div class="Items">
														<div class="ItemList">
															<div class="Item">
																<img
																	src="//opgg-static.akamaized.net/images/lol/item/3074.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #00cfbc'>굶주린 히드라</b><br><span>근접 공격으로 주변의 적에게 피해를 주면 체력이 회복됩니다. </span><br><span><stats>공격력 +80<br>기본 체력 재생 +100% <br>생명력 흡수 +18%</stats><br><br><passive>기본 지속 효과:</passive> 이 아이템으로 가하는 피해에는 총 생명력 흡수의 50%가 적용됩니다.<br><unique>고유 지속 효과 - 베기:</unique> 기본 공격 적중 시 대상 주위의 적들에게 총 공격력의 20%~60%에 해당하는 추가 물리 피해를 입힙니다. (중앙에서 가장 가까운 적에게 가장 큰 피해)<br><active>고유 사용 효과 - 초승달:</active> 주위에 있는 적 유닛에게 총 공격력의 60%~100%에 해당하는 물리 피해를 입힙니다. (중앙에서 가장 가까운 적에게 가장 큰 피해) (재사용 대기시간 10초)</span><br><span>가격:</span> <span style='color: #ffc659'>3500 (400)</span>"
																	alt="굶주린 히드라">
															</div>
															<div class="Item">
																<img
																	src="//opgg-static.akamaized.net/images/lol/item/2055.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip tpd-delegation-uid-1" title=""
																	alt="제어 와드">
															</div>
															<div class="Item">
																<img
																	src="//opgg-static.akamaized.net/images/lol/item/3111.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #00cfbc'>헤르메스의 발걸음</b><br><span>이동 속도가 증가하고, 방해 효과의 지속시간이 줄어듭니다.</span><br><span><groupLimit>1개만 구입 가능합니다.</groupLimit><br><br><stats>마법 저항력 +25</stats><br><br><unique>고유 지속 효과 - 이동 속도 향상:</unique> 이동 속도 +45<br><unique>고유 지속 효과 - 강인함:</unique> 기절, 둔화, 도발, 공포, 침묵, 실명, 변이 및 이동 불가 효과의 지속시간이 30% 감소합니다.</span><br><span>가격:</span> <span style='color: #ffc659'>1100 (350)</span>"
																	alt="헤르메스의 발걸음">
															</div>
															<div class="Item">
																<img
																	src="//opgg-static.akamaized.net/images/lol/item/3340.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #00cfbc'>와드 토템 (장신구)</b><br><span>주기적으로 투명 와드를 설치합니다.</span><br><span><groupLimit>장신구 소지 개수는 1개로 제한됩니다.</groupLimit><br><br><active>사용 시:</active> 충전량을 1회 소모하여 <scaleLevel>90 ~ 120</scaleLevel>초 동안 주변을 드러내 주는 보이지 않는 <font color='#BBFFFF'>투명 와드</font>를 설치합니다. <br><br>매 <scaleLevel>240 ~ 120</scaleLevel>초마다 1회 충전되며 최대 2회까지 충전됩니다.<br><br>와드 지속시간과 충전 주기는 레벨이 오를수록 향상됩니다.<br><br><rules>(플레이어당 맵에 설치할 수 있는 <font color='#BBFFFF'>투명 와드</font>는 3개로 제한됩니다.)</rules></span>"
																	alt="와드 토템 (장신구)">
															</div>
															<div class="Item">
																<img
																	src="//opgg-static.akamaized.net/images/lol/item/1083.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #00cfbc'>수확의 낫</b><br><span>피해를 입히고 적중 시 생명력을 흡수합니다. 미니언 처치 시 추가 골드를 얻습니다.</span><br><span><stats>공격력 +7<br>적중 시 생명력 흡수 +3</stats><br><br><unique>고유 지속 효과:</unique> 공격로 미니언 처치 시 추가로 1 골드를 얻습니다. 공격로 미니언을 총 100회 처치하면 즉시 350의 추가 골드를 얻고 고유 지속 효과가 비활성화됩니다.</span><br><span>가격:</span> <span style='color: #ffc659'>450 (450)</span>"
																	alt="수확의 낫">
															</div>
															<div class="Item">
																<img
																	src="//opgg-static.akamaized.net/images/lol/item/1053.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #00cfbc'>흡혈의 낫</b><br><span>기본 공격 시 체력을 회복합니다.</span><br><span><stats>공격력 +15<br>생명력 흡수 +10%</stats></span><br><span>가격:</span> <span style='color: #ffc659'>900 (550)</span>"
																	alt="흡혈의 낫">
															</div>
															<div class="Item">
																<img
																	src="//opgg-static.akamaized.net/images/lol/item/3078.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #00cfbc'>삼위일체</b><br><span>취급주의: 이 아이템만 갖추면 '엄청난 피해'를 줄 수 있죠...</span><br><span><stats>체력 +250<br><mana>마나 +250</mana><br>공격력 +25<br>공격 속도 +40%<br>재사용 대기시간 감소 +20%<br>이동 속도 +5%</stats><br><br><unique>고유 지속 효과 - 격분:</unique> 기본 공격 시 2초간 이동 속도가 20 상승합니다. 적을 처치하면 이동 속도가 60 상승합니다. 원거리 챔피언의 경우 이동 속도 상승 효과는 절반만 적용됩니다.<br><unique>고유 지속 효과 - 주문 검:</unique> 스킬을 사용하고 나면 다음 기본 공격 적중 시 기본 공격력의 200%에 해당하는 추가 물리 피해를 입힙니다. (재사용 대기시간 1.5초)</span><br><span>가격:</span> <span style='color: #ffc659'>3733 (333)</span>"
																	alt="삼위일체">
															</div>
															<button class="Button OpenBuildButton tip" title="빌드"
																type="button">
																<img class="On"
																	src="//opgg-static.akamaized.net/css3/sprite/images/icon-buildred-p.png">
																<img class="Off"
																	src="//opgg-static.akamaized.net/css3/sprite/images/icon-buildred-p.png">
															</button>
														</div>
														<div class="Trinket">
															<img
																src="//opgg-static.akamaized.net/images/site/summoner/icon-ward-red.png">
															제어 와드 <span class="wards vision">4</span>
														</div>
													</div>
													<div class="FollowPlayers Names">
														<div class="Team">
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-52 tip"
																		title="카사딘">카사딘</div>
																	<div class="Image20 __sprite __spc20 __spc20-52 tip"
																		title="카사딘">카사딘</div>
																</div>
																<div class="SummonerName">
																	<a href="//www.op.gg/summoner/userName=LunaLina"
																		class="Link" target="_blank">LunaLina</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-102 tip"
																		title="세트">세트</div>
																	<div class="Image20 __sprite __spc20 __spc20-102 tip"
																		title="세트">세트</div>
																</div>
																<div class="SummonerName">
																	<a
																		href="//www.op.gg/summoner/userName=%EA%B9%80%ED%83%9C%ED%9B%88%EC%A0%9C%EB%8B%AD%EB%8B%A4%EB%A6%AC"
																		class="Link" target="_blank">김태훈제닭다리</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-106 tip"
																		title="신지드">신지드</div>
																	<div class="Image20 __sprite __spc20 __spc20-106 tip"
																		title="신지드">신지드</div>
																</div>
																<div class="SummonerName">
																	<a href="//www.op.gg/summoner/userName=liu+de+hua"
																		class="Link" target="_blank">liu de hua</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-27 tip"
																		title="이즈리얼">이즈리얼</div>
																	<div class="Image20 __sprite __spc20 __spc20-27 tip"
																		title="이즈리얼">이즈리얼</div>
																</div>
																<div class="SummonerName">
																	<a href="//www.op.gg/summoner/userName=KTA+ADC"
																		class="Link" target="_blank">KTA ADC</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-101 tip"
																		title="세나">세나</div>
																	<div class="Image20 __sprite __spc20 __spc20-101 tip"
																		title="세나">세나</div>
																</div>
																<div class="SummonerName">
																	<a href="//www.op.gg/summoner/userName=024aetcal"
																		class="Link" target="_blank">024aetcal</a>
																</div>
															</div>
														</div>
														<div class="Team">
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-2 tip"
																		title="아칼리">아칼리</div>
																	<div class="Image20 __sprite __spc20 __spc20-2 tip"
																		title="아칼리">아칼리</div>
																</div>
																<div class="SummonerName">
																	<a href="//www.op.gg/summoner/userName=LaP1s+"
																		class="Link" target="_blank">LaP1s </a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-62 tip"
																		title="리 신">리 신</div>
																	<div class="Image20 __sprite __spc20 __spc20-62 tip"
																		title="리 신">리 신</div>
																</div>
																<div class="SummonerName">
																	<a href="//www.op.gg/summoner/userName=Gen+G+Felix"
																		class="Link" target="_blank">Gen G Felix</a>
																</div>
															</div>
															<div class="Summoner Requester">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-16 tip"
																		title="카밀">카밀</div>
																	<div class="Image20 __sprite __spc20 __spc20-16 tip"
																		title="카밀">카밀</div>
																</div>
																<div class="SummonerName">
																	<a href="//www.op.gg/summoner/userName=Hide+on+bush"
																		class="Link" target="_blank">Hide on bush</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-8 tip"
																		title="애쉬">애쉬</div>
																	<div class="Image20 __sprite __spc20 __spc20-8 tip"
																		title="애쉬">애쉬</div>
																</div>
																<div class="SummonerName">
																	<a
																		href="//www.op.gg/summoner/userName=%EB%B0%A4%EC%9D%B4%EC%8B%AB%EC%96%B4"
																		class="Link" target="_blank">밤이싫어</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-50 tip"
																		title="카르마">카르마</div>
																	<div class="Image20 __sprite __spc20 __spc20-50 tip"
																		title="카르마">카르마</div>
																</div>
																<div class="SummonerName">
																	<a href="//www.op.gg/summoner/userName=Khae1"
																		class="Link" target="_blank">Khae1</a>
																</div>
															</div>
														</div>
													</div>
													<div class="StatsButton">
														<div class="Content">
															<div class="Item">
																<a id="right_match_replay" href="#"
																	class="Button Replay OpenSpectateButton"> <span
																	class="__spSite __spSite-159"></span></a>
															</div>
															<div class="Item">
																<a id="right_match" href="#" class="Button MatchDetail">
																	<span class="__spSite __spSite-198 Off"></span> <span
																	class="__spSite __spSite-197 On"></span>
																</a>
															</div>
														</div>
													</div>
												</div>
												<div class="GameDetail"></div>
											</div>
										</div>
										<div class="GameItemWrap">
											<div class="GameItem Win  " data-summoner-id="4460427"
												data-game-time="1599493981" data-game-id="4631140726"
												data-game-result="win">
												<div class="Content">
													<div class="GameStats">
														<div class="GameType" title="솔랭">솔랭</div>
														<div class="TimeStamp">
															<span class="_timeago _timeCountAssigned tip"
																data-datetime="1599493981" data-type=""
																data-interval="60" title="2020년 9월 8일 오전 1시 15분">8시간
																전</span>
														</div>
														<div class="Bar"></div>
														<div class="GameResult">승리</div>
														<div class="GameLength">27분 14초</div>

													</div>
													<div class="GameSettingInfo">
														<div class="ChampionImage">
															<a href="/champion/lucian/statistics" target="_blank"><img
																src="//opgg-static.akamaized.net/images/lol/champion/Lucian.png?image=q_auto,w_46&amp;v=1596679559"
																class="Image" alt="루시안"></a>
														</div>

														<div class="SummonerSpell">
															<div class="Spell">
																<img
																	src="//opgg-static.akamaized.net/images/lol/spell/SummonerExhaust.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #ffc659'>탈진</b><br><span>적 챔피언을 지치게 만들어 3초 동안 이동 속도를 30% 느리게 하고 이 동안 가하는 피해량을 40% 낮춥니다.</span>"
																	alt="탈진">
															</div>
															<div class="Spell">
																<img
																	src="//opgg-static.akamaized.net/images/lol/spell/SummonerFlash.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #ffc659'>점멸</b><br><span>커서 방향으로 챔피언이 짧은 거리를 순간이동합니다.</span>"
																	alt="점멸">
															</div>
														</div>
														<div class="Runes">
															<div class="Rune">
																<img
																	src="//opgg-static.akamaized.net/images/lol/perk/8005.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip tpd-delegation-uid-1" title=""
																	alt="집중 공격">
															</div>
															<div class="Rune">
																<img
																	src="//opgg-static.akamaized.net/images/lol/perkStyle/8200.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #ffc659'>마법</b><br><span>스킬 및 광역 효과 강화</span>"
																	alt="마법">
															</div>
														</div>
														<div class="ChampionName">
															<a href="/champion/lucian/statistics" target="_blank">루시안</a>
														</div>
													</div>
													<div class="KDA">
														<div class="KDA">
															<span class="Kill">8</span> / <span class="Death">4</span>
															/ <span class="Assist">7</span>
														</div>
														<div class="KDARatio">
															<span class="KDARatio ">3.75:1</span> 평점
														</div>
													</div>
													<div class="Stats">
														<div class="Level">레벨15</div>
														<div class="CS">
															<span class="CS tip"
																title="미니언 191  + 몬스터 20<br>분당CS 7.7개">211 (7.7)</span>
															CS
														</div>
														<div class="CKRate tip" title="킬관여율">킬관여 52%</div>
														<div class="MMR">
															<span>매치 평균</span> <br> <b>Grandmaster</b>
														</div>
													</div>
													<div class="Items">
														<div class="ItemList">
															<div class="Item">
																<img
																	src="//opgg-static.akamaized.net/images/lol/item/3153.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #00cfbc'>몰락한 왕의 검</b><br><span>상대의 체력에 비례하여 피해를 입히고, 상대의 이동 속도를 훔칠 수 있습니다.</span><br><span><stats>공격력 +40<br>공격 속도 +25%<br>생명력 흡수 +12%</stats><br><br><unique>고유 지속 효과:</unique> 기본 공격 적중 시 대상 현재 체력의 8%에 해당하는 추가 물리 피해를 입힙니다. (근접 챔피언은 12%)<br><active>고유 사용 효과:</active> 적 챔피언에게 100의 마법 피해를 입히고, 3초 동안 대상 이동 속도의 25%를 훔칩니다. (재사용 대기시간 90초)<br><br><rules>최소 15의 추가 물리 피해를 입힙니다.<br>몬스터 및 미니언에게 최대 60의 추가 물리 피해를 입힙니다.<br>사용자의 생명력 흡수가 입힌 추가 물리 피해에 적용됩니다.</rules></span><br><span>가격:</span> <span style='color: #ffc659'>3300 (700)</span>"
																	alt="몰락한 왕의 검">
															</div>
															<div class="Item">
																<img
																	src="//opgg-static.akamaized.net/images/lol/item/2033.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #00cfbc'>부패 물약</b><br><span>체력과 마나가 일정 시간 동안 회복되고 전투 능력을 상승시킵니다. 상점에 가면 다시 충전됩니다.</span><br><span><groupLimit>한 번에 한 종류의 회복 물약만 소지할 수 있습니다.</groupLimit><br><br><active>고유 사용 효과:</active> 충전량을 1회 소모해 12초 동안 125의 체력과 75의 마나를 회복하고, 그 동안 <font color='#FF8811'><u>부패의 손길</u></font>을 활성화합니다. 상점 방문 시 3회의 충전량이 다시 채워집니다.<br><br><font color='#FF8811'><u>부패의 손길:</u></font> 적 챔피언에게 주문 및 공격으로 피해를 입히면 적을 불태워 3초 동안 15의 마법 피해를 입힙니다. (광역 및 지속 피해 스킬 사용 시에는 피해의 50%만 적용됩니다. 피해량은 챔피언 레벨에 비례해 증가합니다.)<br><br><rules>(부패 물약은 체력과 마나가 모두 차 있을 때도 사용할 수 있습니다.)</rules></span><br><span>가격:</span> <span style='color: #ffc659'>500 (350)</span>"
																	alt="부패 물약">
															</div>
															<div class="Item">
																<img
																	src="//opgg-static.akamaized.net/images/lol/item/3133.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #00cfbc'>콜필드의 전투 망치</b><br><span>공격력과 재사용 대기시간 감소율이 증가합니다.</span><br><span><stats>공격력 +25</stats><br><br><unique>고유 지속 효과:</unique> 재사용 대기시간 감소 +10%</span><br><span>가격:</span> <span style='color: #ffc659'>1100 (400)</span>"
																	alt="콜필드의 전투 망치">
															</div>
															<div class="Item">
																<img
																	src="//opgg-static.akamaized.net/images/lol/item/3363.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #00cfbc'>망원형 개조</b><br><span>설치 범위가 증가하며 대상 지역을 드러내 줍니다.</span><br><span><levelLimit>업그레이드하려면 9레벨 이상이 되어야 합니다.</levelLimit><br><groupLimit>장신구 소지 개수는 1개로 제한됩니다.</groupLimit><br><br><font color='#FFFFFF'>와드 토템</font> 장신구 업그레이드 시:<br><br><stats><font color='#00FF00'>+</font> 설치 가능 범위 대폭(+650%) 증가<br><font color='#00FF00'>+</font> 지속시간 제한 없음, 와드 설치 개수 제한에 관계 없음<br><font color='#FF0000'>-</font> <font color='#FF6600'>재사용 대기시간 10% 증가</font><br><font color='#FF0000'>-</font> <font color='#FF6600'>누구나 볼 수 있는 와드로, 파괴 가능하고 아군의 대상으로 지정 불가</font><br><font color='#FF0000'>-</font> <font color='#FF6600'>와드 시야 범위 45% 감소</font><br><font color='#FF0000'>-</font> <font color='#FF6600'>상점 방문 시 충전되지 않음</font></stats></span>"
																	alt="망원형 개조">
															</div>
															<div class="Item">
																<img
																	src="//opgg-static.akamaized.net/images/lol/item/3071.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #00cfbc'>칠흑의 양날 도끼</b><br><span>적 챔피언에게 물리 피해를 입히면 적의 방어력이 감소합니다.</span><br><span><stats>체력 +400<br>공격력 +40<br>재사용 대기시간 감소 +20%</stats><br><br><unique>고유 지속 효과:</unique> 적 챔피언에게 물리 피해를 입히면 대상을 베어, 6초 동안 방어력을 4% 감소시킵니다. (최대 6번, 24%까지 중첩)<br><unique>고유 지속 효과 - 격분:</unique> 물리 피해를 입히면 2초 동안 이동 속도가 20 상승합니다. 베어낸 적 챔피언의 처치를 돕거나 어떤 유닛이든 처치하면 대신 2초 동안 이동 속도가 60 상승합니다. 원거리 챔피언은 이 이동 속도의 절반만 상승합니다.</span><br><span>가격:</span> <span style='color: #ffc659'>3000 (950)</span>"
																	alt="칠흑의 양날 도끼">
															</div>
															<div class="Item">
																<img
																	src="//opgg-static.akamaized.net/images/lol/item/3006.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #00cfbc'>광전사의 군화</b><br><span>이동 속도와 공격 속도가 상승합니다.</span><br><span><groupLimit>1개만 구입 가능합니다.</groupLimit><br><br><stats> 공격 속도 +35%</stats><br><br><unique>고유 지속 효과 - 이동 속도 향상:</unique> 이동 속도 +45</span><br><span>가격:</span> <span style='color: #ffc659'>1100 (500)</span>"
																	alt="광전사의 군화">
															</div>
															<div class="Item">
																<img
																	src="//opgg-static.akamaized.net/images/lol/item/1018.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #00cfbc'>민첩성의 망토</b><br><span>치명타 확률이 증가합니다.</span><br><span><stats>치명타 확률 +20%</stats></span><br><span>가격:</span> <span style='color: #ffc659'>800 (800)</span>"
																	alt="민첩성의 망토">
															</div>
															<button class="Button OpenBuildButton tip" title="빌드"
																type="button">
																<img class="On"
																	src="//opgg-static.akamaized.net/css3/sprite/images/icon-buildblue-p.png">
																<img class="Off"
																	src="//opgg-static.akamaized.net/css3/sprite/images/icon-buildblue-p.png">
															</button>
														</div>
														<div class="Trinket">
															<img
																src="//opgg-static.akamaized.net/images/site/summoner/icon-ward-blue.png">
															제어 와드 <span class="wards vision">3</span>
														</div>
													</div>
													<div class="FollowPlayers Names">
														<div class="Team">
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-2 tip"
																		title="아칼리">아칼리</div>
																	<div class="Image20 __sprite __spc20 __spc20-2 tip"
																		title="아칼리">아칼리</div>
																</div>
																<div class="SummonerName">
																	<a href="//www.op.gg/summoner/userName=Jianguoqiang"
																		class="Link" target="_blank">Jianguoqiang</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-28 tip"
																		title="피들스틱">피들스틱</div>
																	<div class="Image20 __sprite __spc20 __spc20-28 tip"
																		title="피들스틱">피들스틱</div>
																</div>
																<div class="SummonerName">
																	<a href="//www.op.gg/summoner/userName=+brush+wild"
																		class="Link" target="_blank"> brush wild</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-145 tip"
																		title="제드">제드</div>
																	<div class="Image20 __sprite __spc20 __spc20-145 tip"
																		title="제드">제드</div>
																</div>
																<div class="SummonerName">
																	<a href="//www.op.gg/summoner/userName=cautious+mid"
																		class="Link" target="_blank">cautious mid</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-46 tip"
																		title="진">진</div>
																	<div class="Image20 __sprite __spc20 __spc20-46 tip"
																		title="진">진</div>
																</div>
																<div class="SummonerName">
																	<a
																		href="//www.op.gg/summoner/userName=%EB%AC%BB%EC%96%B4%EA%B0%80%EB%8A%94%EC%A1%B4%EC%9E%AC"
																		class="Link" target="_blank">묻어가는존재</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-120 tip"
																		title="쓰레쉬">쓰레쉬</div>
																	<div class="Image20 __sprite __spc20 __spc20-120 tip"
																		title="쓰레쉬">쓰레쉬</div>
																</div>
																<div class="SummonerName">
																	<a href="//www.op.gg/summoner/userName=H4rp"
																		class="Link" target="_blank">H4rp</a>
																</div>
															</div>
														</div>
														<div class="Team">
															<div class="Summoner Requester">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-66 tip"
																		title="루시안">루시안</div>
																	<div class="Image20 __sprite __spc20 __spc20-66 tip"
																		title="루시안">루시안</div>
																</div>
																<div class="SummonerName">
																	<a href="//www.op.gg/summoner/userName=Hide+on+bush"
																		class="Link" target="_blank">Hide on bush</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-41 tip"
																		title="아이번">아이번</div>
																	<div class="Image20 __sprite __spc20 __spc20-41 tip"
																		title="아이번">아이번</div>
																</div>
																<div class="SummonerName">
																	<a
																		href="//www.op.gg/summoner/userName=%EC%95%84%EC%9D%B4%EB%B2%88%EB%A7%A82"
																		class="Link" target="_blank">아이번맨2</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-56 tip"
																		title="케넨">케넨</div>
																	<div class="Image20 __sprite __spc20 __spc20-56 tip"
																		title="케넨">케넨</div>
																</div>
																<div class="SummonerName">
																	<a
																		href="//www.op.gg/summoner/userName=%EC%B0%B8%EA%B3%A0+%EA%B2%AC%EB%94%94%EB%8A%94+%EC%82%AC%EB%9E%8C"
																		class="Link" target="_blank">참고 견디는 사람</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-49 tip"
																		title="칼리스타">칼리스타</div>
																	<div class="Image20 __sprite __spc20 __spc20-49 tip"
																		title="칼리스타">칼리스타</div>
																</div>
																<div class="SummonerName">
																	<a href="//www.op.gg/summoner/userName=Clever7"
																		class="Link" target="_blank">Clever7</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-118 tip"
																		title="타릭">타릭</div>
																	<div class="Image20 __sprite __spc20 __spc20-118 tip"
																		title="타릭">타릭</div>
																</div>
																<div class="SummonerName">
																	<a href="//www.op.gg/summoner/userName=just+chillax"
																		class="Link" target="_blank">just chillax</a>
																</div>
															</div>
														</div>
													</div>
													<div class="StatsButton">
														<div class="Content">
															<div class="Item">
																<a id="right_match_replay" href="#"
																	class="Button Replay OpenSpectateButton"> <span
																	class="__spSite __spSite-159"></span></a>
															</div>
															<div class="Item">
																<a id="right_match" href="#" class="Button MatchDetail">
																	<span class="__spSite __spSite-194 Off"></span> <span
																	class="__spSite __spSite-193 On"></span>
																</a>
															</div>
														</div>
													</div>
												</div>
												<div class="GameDetail"></div>
											</div>
										</div>
										<div class="GameItemWrap">
											<div class="GameItem Lose  " data-summoner-id="4460427"
												data-game-time="1599491940" data-game-id="4631063920"
												data-game-result="lose">
												<div class="Content">
													<div class="GameStats">
														<div class="GameType" title="솔랭">솔랭</div>
														<div class="TimeStamp">
															<span class="_timeago _timeCountAssigned tip"
																data-datetime="1599491940" data-type=""
																data-interval="60" title="2020년 9월 8일 오전 12시 41분">9시간
																전</span>
														</div>
														<div class="Bar"></div>
														<div class="GameResult">패배</div>
														<div class="GameLength">30분 54초</div>

													</div>
													<div class="GameSettingInfo">
														<div class="ChampionImage">
															<a href="/champion/lucian/statistics" target="_blank"><img
																src="//opgg-static.akamaized.net/images/lol/champion/Lucian.png?image=q_auto,w_46&amp;v=1596679559"
																class="Image" alt="루시안"></a>
														</div>

														<div class="SummonerSpell">
															<div class="Spell">
																<img
																	src="//opgg-static.akamaized.net/images/lol/spell/SummonerExhaust.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #ffc659'>탈진</b><br><span>적 챔피언을 지치게 만들어 3초 동안 이동 속도를 30% 느리게 하고 이 동안 가하는 피해량을 40% 낮춥니다.</span>"
																	alt="탈진">
															</div>
															<div class="Spell">
																<img
																	src="//opgg-static.akamaized.net/images/lol/spell/SummonerFlash.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #ffc659'>점멸</b><br><span>커서 방향으로 챔피언이 짧은 거리를 순간이동합니다.</span>"
																	alt="점멸">
															</div>
														</div>
														<div class="Runes">
															<div class="Rune">
																<img
																	src="//opgg-static.akamaized.net/images/lol/perk/8005.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #ffc659'>집중 공격</b><br><span>적 챔피언에게 연속으로 3회 기본 공격을 가하면 레벨에 따라 40 ~ 180의 추가 <lol-uikit-tooltipped-keyword key='LinkTooltip_Description_AdaptiveDmg'><font color='#48C4B7'>적응형 피해</font></lol-uikit-tooltipped-keyword>를 입히고 적의 약점을 노출시킵니다. 약점이 노출된 적은 6초 동안 모든 상대에게서 8 ~ 12%의 추가 피해를 받습니다.</span>"
																	alt="집중 공격">
															</div>
															<div class="Rune">
																<img
																	src="//opgg-static.akamaized.net/images/lol/perkStyle/8300.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #ffc659'>영감</b><br><span>다양한 방식의 전투 보조</span>"
																	alt="영감">
															</div>
														</div>
														<div class="ChampionName">
															<a href="/champion/lucian/statistics" target="_blank">루시안</a>
														</div>
													</div>
													<div class="KDA">
														<div class="KDA">
															<span class="Kill">6</span> / <span class="Death">7</span>
															/ <span class="Assist">9</span>
														</div>
														<div class="KDARatio">
															<span class="KDARatio ">2.14:1</span> 평점
														</div>
														<div class="Badge">
															<span class="Text ACE">ACE</span>
														</div>
													</div>
													<div class="Stats">
														<div class="Level">레벨15</div>
														<div class="CS">
															<span class="CS tip"
																title="미니언 206  + 몬스터 30<br>분당CS 7.6개">236 (7.6)</span>
															CS
														</div>
														<div class="CKRate tip tpd-delegation-uid-1" title="">
															킬관여 71%</div>
														<div class="MMR">
															<span>매치 평균</span> <br> <b>Grandmaster</b>
														</div>
													</div>
													<div class="Items">
														<div class="ItemList">
															<div class="Item">
																<img
																	src="//opgg-static.akamaized.net/images/lol/item/3153.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #00cfbc'>몰락한 왕의 검</b><br><span>상대의 체력에 비례하여 피해를 입히고, 상대의 이동 속도를 훔칠 수 있습니다.</span><br><span><stats>공격력 +40<br>공격 속도 +25%<br>생명력 흡수 +12%</stats><br><br><unique>고유 지속 효과:</unique> 기본 공격 적중 시 대상 현재 체력의 8%에 해당하는 추가 물리 피해를 입힙니다. (근접 챔피언은 12%)<br><active>고유 사용 효과:</active> 적 챔피언에게 100의 마법 피해를 입히고, 3초 동안 대상 이동 속도의 25%를 훔칩니다. (재사용 대기시간 90초)<br><br><rules>최소 15의 추가 물리 피해를 입힙니다.<br>몬스터 및 미니언에게 최대 60의 추가 물리 피해를 입힙니다.<br>사용자의 생명력 흡수가 입힌 추가 물리 피해에 적용됩니다.</rules></span><br><span>가격:</span> <span style='color: #ffc659'>3300 (700)</span>"
																	alt="몰락한 왕의 검">
															</div>
															<div class="Item">
																<img
																	src="//opgg-static.akamaized.net/images/lol/item/2055.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #00cfbc'>제어 와드</b><br><span>일정 지역 안의 와드와 투명 덫을 무력화시킵니다.</span><br><span><groupLimit>제어 와드는 가방에 2개만 소지할 수 있습니다.</groupLimit><br><br><consumable>클릭하여 사용:</consumable> 주변 지역을 드러내 주는 와드를 설치합니다. 근처의 투명한 덫과 와드를 드러내고, 추가로 와드를 무력화시킵니다. 위장 중인 유닛의 모습도 드러냅니다. 하지만 제어 와드로 다른 제어 와드를 무력화시킬 수는 없습니다.<br><br>플레이어 당 맵에 설치할 수 있는 <font color='#BBFFFF'>제어 와드</font>의 개수는  1개로 제한됩니다.</span><br><span>가격:</span> <span style='color: #ffc659'>75 (75)</span>"
																	alt="제어 와드">
															</div>
															<div class="Item">
																<img
																	src="//opgg-static.akamaized.net/images/lol/item/3047.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #00cfbc'>닌자의 신발</b><br><span>이동 속도가 증가하고, 적에게 받는 기본 공격의 피해가 줄어듭니다.</span><br><span><groupLimit>1개만 구입 가능합니다.</groupLimit><br><br><stats>방어력 +20</stats><br><br><unique>고유 지속 효과:</unique> 기본 공격 피해량의 12%를 막아 줍니다.<br><unique>고유 지속 효과 - 이동 속도 향상:</unique> 이동 속도 +45</span><br><span>가격:</span> <span style='color: #ffc659'>1100 (500)</span>"
																	alt="닌자의 신발">
															</div>
															<div class="Item">
																<img
																	src="//opgg-static.akamaized.net/images/lol/item/3363.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #00cfbc'>망원형 개조</b><br><span>설치 범위가 증가하며 대상 지역을 드러내 줍니다.</span><br><span><levelLimit>업그레이드하려면 9레벨 이상이 되어야 합니다.</levelLimit><br><groupLimit>장신구 소지 개수는 1개로 제한됩니다.</groupLimit><br><br><font color='#FFFFFF'>와드 토템</font> 장신구 업그레이드 시:<br><br><stats><font color='#00FF00'>+</font> 설치 가능 범위 대폭(+650%) 증가<br><font color='#00FF00'>+</font> 지속시간 제한 없음, 와드 설치 개수 제한에 관계 없음<br><font color='#FF0000'>-</font> <font color='#FF6600'>재사용 대기시간 10% 증가</font><br><font color='#FF0000'>-</font> <font color='#FF6600'>누구나 볼 수 있는 와드로, 파괴 가능하고 아군의 대상으로 지정 불가</font><br><font color='#FF0000'>-</font> <font color='#FF6600'>와드 시야 범위 45% 감소</font><br><font color='#FF0000'>-</font> <font color='#FF6600'>상점 방문 시 충전되지 않음</font></stats></span>"
																	alt="망원형 개조">
															</div>
															<div class="Item">
																<img
																	src="//opgg-static.akamaized.net/images/lol/item/3508.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #00cfbc'>정수 약탈자</b><br><span>치명타 확률과 공격력이 증가하고 재사용 대기시간이 감소하며 공격 적중 시 마나를 회복합니다.</span><br><span><stats>공격력 +70<br>치명타 확률 +25%</stats><br><br><unique>고유 지속 효과:</unique> 재사용 대기시간 감소 +20%<br><unique>고유 지속 효과:</unique> 기본 공격 시 잃은 마나의 1.5%를 회복합니다.</span><br><span>가격:</span> <span style='color: #ffc659'>3300 (100)</span>"
																	alt="정수 약탈자">
															</div>
															<div class="Item">
																<img
																	src="//opgg-static.akamaized.net/images/lol/item/1018.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #00cfbc'>민첩성의 망토</b><br><span>치명타 확률이 증가합니다.</span><br><span><stats>치명타 확률 +20%</stats></span><br><span>가격:</span> <span style='color: #ffc659'>800 (800)</span>"
																	alt="민첩성의 망토">
															</div>
															<div class="Item">
																<img
																	src="//opgg-static.akamaized.net/images/lol/item/3071.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #00cfbc'>칠흑의 양날 도끼</b><br><span>적 챔피언에게 물리 피해를 입히면 적의 방어력이 감소합니다.</span><br><span><stats>체력 +400<br>공격력 +40<br>재사용 대기시간 감소 +20%</stats><br><br><unique>고유 지속 효과:</unique> 적 챔피언에게 물리 피해를 입히면 대상을 베어, 6초 동안 방어력을 4% 감소시킵니다. (최대 6번, 24%까지 중첩)<br><unique>고유 지속 효과 - 격분:</unique> 물리 피해를 입히면 2초 동안 이동 속도가 20 상승합니다. 베어낸 적 챔피언의 처치를 돕거나 어떤 유닛이든 처치하면 대신 2초 동안 이동 속도가 60 상승합니다. 원거리 챔피언은 이 이동 속도의 절반만 상승합니다.</span><br><span>가격:</span> <span style='color: #ffc659'>3000 (950)</span>"
																	alt="칠흑의 양날 도끼">
															</div>
															<button class="Button OpenBuildButton tip" title="빌드"
																type="button">
																<img class="On"
																	src="//opgg-static.akamaized.net/css3/sprite/images/icon-buildred-p.png">
																<img class="Off"
																	src="//opgg-static.akamaized.net/css3/sprite/images/icon-buildred-p.png">
															</button>
														</div>
														<div class="Trinket">
															<img
																src="//opgg-static.akamaized.net/images/site/summoner/icon-ward-red.png">
															제어 와드 <span class="wards vision">11</span>
														</div>
													</div>
													<div class="FollowPlayers Names">
														<div class="Team">
															<div class="Summoner Requester">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-66 tip"
																		title="루시안">루시안</div>
																	<div class="Image20 __sprite __spc20 __spc20-66 tip"
																		title="루시안">루시안</div>
																</div>
																<div class="SummonerName">
																	<a href="//www.op.gg/summoner/userName=Hide+on+bush"
																		class="Link" target="_blank">Hide on bush</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-25 tip"
																		title="엘리스">엘리스</div>
																	<div class="Image20 __sprite __spc20 __spc20-25 tip"
																		title="엘리스">엘리스</div>
																</div>
																<div class="SummonerName">
																	<a
																		href="//www.op.gg/summoner/userName=%EB%B4%89%EA%B3%A8%EB%A0%88%ED%8C%8C%EC%8A%A4%ED%83%80%EC%82%AC%EC%A4%98"
																		class="Link" target="_blank">봉골레파스타사줘</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-67 tip"
																		title="룰루">룰루</div>
																	<div class="Image20 __sprite __spc20 __spc20-67 tip"
																		title="룰루">룰루</div>
																</div>
																<div class="SummonerName">
																	<a
																		href="//www.op.gg/summoner/userName=%EB%B3%84%EC%82%AC%ED%83%95%EC%9D%B4%EC%A2%8B%EC%95%84%EC%9A%94"
																		class="Link" target="_blank">별사탕이좋아요</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-27 tip"
																		title="이즈리얼">이즈리얼</div>
																	<div class="Image20 __sprite __spc20 __spc20-27 tip"
																		title="이즈리얼">이즈리얼</div>
																</div>
																<div class="SummonerName">
																	<a
																		href="//www.op.gg/summoner/userName=Active+every+day"
																		class="Link" target="_blank">Active every day</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-76 tip"
																		title="모르가나">모르가나</div>
																	<div class="Image20 __sprite __spc20 __spc20-76 tip"
																		title="모르가나">모르가나</div>
																</div>
																<div class="SummonerName">
																	<a href="//www.op.gg/summoner/userName=q77"
																		class="Link" target="_blank">q77</a>
																</div>
															</div>
														</div>
														<div class="Team">
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-95 tip"
																		title="레넥톤">레넥톤</div>
																	<div class="Image20 __sprite __spc20 __spc20-95 tip"
																		title="레넥톤">레넥톤</div>
																</div>
																<div class="SummonerName">
																	<a href="//www.op.gg/summoner/userName=Apolosius"
																		class="Link" target="_blank">Apolosius</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-24 tip"
																		title="에코">에코</div>
																	<div class="Image20 __sprite __spc20 __spc20-24 tip"
																		title="에코">에코</div>
																</div>
																<div class="SummonerName">
																	<a href="//www.op.gg/summoner/userName=tian+fu+yi+bing"
																		class="Link" target="_blank">tian fu yi bing</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-145 tip"
																		title="제드">제드</div>
																	<div class="Image20 __sprite __spc20 __spc20-145 tip"
																		title="제드">제드</div>
																</div>
																<div class="SummonerName">
																	<a href="//www.op.gg/summoner/userName=cautious+mid"
																		class="Link" target="_blank">cautious mid</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-46 tip"
																		title="진">진</div>
																	<div class="Image20 __sprite __spc20 __spc20-46 tip"
																		title="진">진</div>
																</div>
																<div class="SummonerName">
																	<a href="//www.op.gg/summoner/userName=XXXTENTACION"
																		class="Link" target="_blank">XXXTENTACION</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-120 tip"
																		title="쓰레쉬">쓰레쉬</div>
																	<div class="Image20 __sprite __spc20 __spc20-120 tip"
																		title="쓰레쉬">쓰레쉬</div>
																</div>
																<div class="SummonerName">
																	<a href="//www.op.gg/summoner/userName=beer124"
																		class="Link" target="_blank">beer124</a>
																</div>
															</div>
														</div>
													</div>
													<div class="StatsButton">
														<div class="Content">
															<div class="Item">
																<a id="right_match_replay" href="#"
																	class="Button Replay OpenSpectateButton"> <span
																	class="__spSite __spSite-159"></span></a>
															</div>
															<div class="Item">
																<a id="right_match" href="#" class="Button MatchDetail">
																	<span class="__spSite __spSite-198 Off"></span> <span
																	class="__spSite __spSite-197 On"></span>
																</a>
															</div>
														</div>
													</div>
												</div>
												<div class="GameDetail"></div>
											</div>
										</div>
										<div class="GameItemWrap">
											<div class="GameItem Lose  " data-summoner-id="4460427"
												data-game-time="1599476436" data-game-id="4630426538"
												data-game-result="lose">
												<div class="Content">
													<div class="GameStats">
														<div class="GameType" title="솔랭">솔랭</div>
														<div class="TimeStamp">
															<span class="_timeago _timeCountAssigned tip"
																data-datetime="1599476436" data-type=""
																data-interval="60" title="2020년 9월 7일 오후 8시 23분">13시간
																전</span>
														</div>
														<div class="Bar"></div>
														<div class="GameResult">패배</div>
														<div class="GameLength">27분 12초</div>

													</div>
													<div class="GameSettingInfo">
														<div class="ChampionImage">
															<a href="/champion/lillia/statistics" target="_blank"><img
																src="//opgg-static.akamaized.net/images/lol/champion/Lillia.png?image=q_auto,w_46&amp;v=1596679559"
																class="Image" alt="릴리아"></a>
														</div>

														<div class="SummonerSpell">
															<div class="Spell">
																<img
																	src="//opgg-static.akamaized.net/images/lol/spell/SummonerSmite.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #ffc659'>강타</b><br><span>대상 에픽 및 대형/중형 몬스터, 혹은 적 미니언에게 390~1,000(챔피언 레벨에 따라 변동)의 고정 피해를 입힙니다. 몬스터에게 사용하면 자신의 최대 체력에 비례해 체력을 회복합니다.</span>"
																	alt="강타">
															</div>
															<div class="Spell">
																<img
																	src="//opgg-static.akamaized.net/images/lol/spell/SummonerFlash.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #ffc659'>점멸</b><br><span>커서 방향으로 챔피언이 짧은 거리를 순간이동합니다.</span>"
																	alt="점멸">
															</div>
														</div>
														<div class="Runes">
															<div class="Rune">
																<img
																	src="//opgg-static.akamaized.net/images/lol/perk/8230.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #ffc659'>난입</b><br><span>4초 안에 한 챔피언에게 기본 공격 3회 또는 <b>개별</b> 스킬 3회를 적중시키면 레벨에 따라 25~40%의 이동 속도와 75%의 둔화 저항 효과를 얻습니다. <br><br>근접 챔피언의 경우 이동 속도가 40~60% 증가합니다.<br><br>지속시간: 3초<br>재사용 대기시간: 15초</span>"
																	alt="난입">
															</div>
															<div class="Rune">
																<img
																	src="//opgg-static.akamaized.net/images/lol/perkStyle/8100.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #ffc659'>지배</b><br><span>강력한 피해와 빠른 접근</span>"
																	alt="지배">
															</div>
														</div>
														<div class="ChampionName">
															<a href="/champion/lillia/statistics" target="_blank">릴리아</a>
														</div>
													</div>
													<div class="KDA">
														<div class="KDA">
															<span class="Kill">5</span> / <span class="Death">2</span>
															/ <span class="Assist">8</span>
														</div>
														<div class="KDARatio">
															<span class="KDARatio ">6.50:1</span> 평점
														</div>
														<div class="MultiKill">
															<span class="Kill">더블킬</span>
														</div>
														<div class="Badge">
															<span class="Text ACE">ACE</span>
														</div>
													</div>
													<div class="Stats">
														<div class="Level">레벨14</div>
														<div class="CS">
															<span class="CS tip"
																title="미니언 32  + 몬스터 144<br>분당CS 6.5개">176 (6.5)</span>
															CS
														</div>
														<div class="CKRate tip" title="킬관여율">킬관여 81%</div>
														<div class="MMR">
															<span>매치 평균</span> <br> <b>Grandmaster</b>
														</div>
													</div>
													<div class="Items">
														<div class="ItemList">
															<div class="Item">
																<img
																	src="//opgg-static.akamaized.net/images/lol/item/3157.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #00cfbc'>존야의 모래시계</b><br><span>사용하면 아무런 행동도 취할 수 없는 대신 공격도 받지 않는 무적 상태가 됩니다.</span><br><span><stats>주문력 +75<br>방어력 +45<br>재사용 대기시간 감소 +10%</stats><br><br><active>고유 사용 효과 - 경직:</active> 챔피언이 2.5초 동안 아무런 행동도 취할 수 없는 대신 공격도 받지 않는 무적 상태가 됩니다. (재사용 대기시간 120초)</span><br><span>가격:</span> <span style='color: #ffc659'>2900 (250)</span>"
																	alt="존야의 모래시계">
															</div>
															<div class="Item">
																<img
																	src="//opgg-static.akamaized.net/images/lol/item/2055.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #00cfbc'>제어 와드</b><br><span>일정 지역 안의 와드와 투명 덫을 무력화시킵니다.</span><br><span><groupLimit>제어 와드는 가방에 2개만 소지할 수 있습니다.</groupLimit><br><br><consumable>클릭하여 사용:</consumable> 주변 지역을 드러내 주는 와드를 설치합니다. 근처의 투명한 덫과 와드를 드러내고, 추가로 와드를 무력화시킵니다. 위장 중인 유닛의 모습도 드러냅니다. 하지만 제어 와드로 다른 제어 와드를 무력화시킬 수는 없습니다.<br><br>플레이어 당 맵에 설치할 수 있는 <font color='#BBFFFF'>제어 와드</font>의 개수는  1개로 제한됩니다.</span><br><span>가격:</span> <span style='color: #ffc659'>75 (75)</span>"
																	alt="제어 와드">
															</div>
															<div class="Item">
																<img
																	src="//opgg-static.akamaized.net/images/lol/item/3136.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #00cfbc'>기괴한 가면</b><br><span>마법 피해량이 증가합니다.</span><br><span><stats>주문력 +35<br>체력 +200</stats><br><br><unique>고유 지속 효과 - 광기:</unique> 적 챔피언과 전투 시 매초 2%의 추가 피해를 입힙니다. (최대 10%)</span><br><span>가격:</span> <span style='color: #ffc659'>1500 (665)</span>"
																	alt="기괴한 가면">
															</div>
															<div class="Item">
																<img
																	src="//opgg-static.akamaized.net/images/lol/item/3364.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #00cfbc'>예언자의 렌즈</b><br><span>근처의 투명한 와드와 덫을 일정 시간 동안 차단합니다.</span><br><span><groupLimit>장신구 소지 개수는 1개로 제한됩니다.</groupLimit><br><br><active>사용 시:</active> 10초 동안 근처를 수색해 적 유닛이 숨어 있으면 경고를 보내며 주변의 투명한 덫과 와드를 드러내고, 추가로 와드를 무력화시킵니다. (재사용 대기시간 90~60초)</span>"
																	alt="예언자의 렌즈">
															</div>
															<div class="Item">
																<img
																	src="//opgg-static.akamaized.net/images/lol/item/3047.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #00cfbc'>닌자의 신발</b><br><span>이동 속도가 증가하고, 적에게 받는 기본 공격의 피해가 줄어듭니다.</span><br><span><groupLimit>1개만 구입 가능합니다.</groupLimit><br><br><stats>방어력 +20</stats><br><br><unique>고유 지속 효과:</unique> 기본 공격 피해량의 12%를 막아 줍니다.<br><unique>고유 지속 효과 - 이동 속도 향상:</unique> 이동 속도 +45</span><br><span>가격:</span> <span style='color: #ffc659'>1100 (500)</span>"
																	alt="닌자의 신발">
															</div>
															<div class="Item">
																<img
																	src="//opgg-static.akamaized.net/images/lol/item/3067.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #00cfbc'>점화석</b><br><span>체력과 재사용 대기시간 감소량이 증가합니다.</span><br><span><stats>체력 +200  </stats><br><br><unique>고유 지속 효과:</unique> 재사용 대기시간 감소 +10%</span><br><span>가격:</span> <span style='color: #ffc659'>800 (400)</span>"
																	alt="점화석">
															</div>
															<div class="Item">
																<img
																	src="//opgg-static.akamaized.net/images/lol/item/1402.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #00cfbc'>마법 부여: 룬의 메아리</b><br><span>주문력이 증가하고 주기적으로 스킬이 강화됩니다.</span><br><span><stats>주문력 +80<br>재사용 대기시간 감소 +10%<br><mana>마나 +300</mana></stats><br><br><unique>고유 지속 효과 - 메아리:</unique> 이동하거나 스킬을 사용하면 중첩이 쌓입니다. 중첩이 100회 쌓이면 다음에 스킬로 피해를 입혔을 때 중첩을 모두 소모하여 최대 4명의 대상에게 60 (+ 주문력의 10%)의 추가 마법 피해를 입힙니다.<br><br>대형 몬스터에게는 250%의 피해를 입히며, 이 효과가 대형 몬스터에게 적중하면 잃은 마나의 25%를 회복합니다.<br><br><groupLimit>골드 획득 아이템이나 정글 아이템은 1개로 소지가 제한됩니다.</groupLimit></span><br><span>가격:</span> <span style='color: #ffc659'>2500 (250)</span>"
																	alt="마법 부여: 룬의 메아리">
															</div>
															<button class="Button OpenBuildButton tip" title="빌드"
																type="button">
																<img class="On"
																	src="//opgg-static.akamaized.net/css3/sprite/images/icon-buildred-p.png">
																<img class="Off"
																	src="//opgg-static.akamaized.net/css3/sprite/images/icon-buildred-p.png">
															</button>
														</div>
														<div class="Trinket">
															<img
																src="//opgg-static.akamaized.net/images/site/summoner/icon-ward-red.png">
															제어 와드 <span class="wards vision">10</span>
														</div>
													</div>
													<div class="FollowPlayers Names">
														<div class="Team">
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-29 tip"
																		title="피오라">피오라</div>
																	<div class="Image20 __sprite __spc20 __spc20-29 tip"
																		title="피오라">피오라</div>
																</div>
																<div class="SummonerName">
																	<a
																		href="//www.op.gg/summoner/userName=FPXzhaoUP4506303"
																		class="Link" target="_blank">FPXzhaoUP4506303</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-58 tip"
																		title="킨드레드">킨드레드</div>
																	<div class="Image20 __sprite __spc20 __spc20-58 tip"
																		title="킨드레드">킨드레드</div>
																</div>
																<div class="SummonerName">
																	<a href="//www.op.gg/summoner/userName=Awe+BBakPyo"
																		class="Link" target="_blank">Awe BBakPyo</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-52 tip"
																		title="카사딘">카사딘</div>
																	<div class="Image20 __sprite __spc20 __spc20-52 tip"
																		title="카사딘">카사딘</div>
																</div>
																<div class="SummonerName">
																	<a href="//www.op.gg/summoner/userName=LunaLina"
																		class="Link" target="_blank">LunaLina</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-73 tip"
																		title="미스 포츈">미스 포츈</div>
																	<div class="Image20 __sprite __spc20 __spc20-73 tip"
																		title="미스 포츈">미스 포츈</div>
																</div>
																<div class="SummonerName">
																	<a
																		href="//www.op.gg/summoner/userName=%EC%8B%9D%ED%98%9C%EC%84%B1%EC%95%A0%EC%9E%90"
																		class="Link" target="_blank">식혜성애자</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-98 tip"
																		title="럼블">럼블</div>
																	<div class="Image20 __sprite __spc20 __spc20-98 tip"
																		title="럼블">럼블</div>
																</div>
																<div class="SummonerName">
																	<a
																		href="//www.op.gg/summoner/userName=%EB%8B%AC%EC%84%B1%EC%84%9C%EC%94%A8%EC%84%9C%EC%98%88%EC%84%B1"
																		class="Link" target="_blank">달성서씨서예성</a>
																</div>
															</div>
														</div>
														<div class="Team">
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div
																		class="Image16 __sprite __spc16 __spc16-16 tip tpd-delegation-uid-1"
																		title="">카밀</div>
																	<div class="Image20 __sprite __spc20 __spc20-16 tip"
																		title="카밀">카밀</div>
																</div>
																<div class="SummonerName">
																	<a href="//www.op.gg/summoner/userName=Last11"
																		class="Link" target="_blank">Last11</a>
																</div>
															</div>
															<div class="Summoner Requester">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-64 tip"
																		title="릴리아">릴리아</div>
																	<div class="Image20 __sprite __spc20 __spc20-64 tip"
																		title="릴리아">릴리아</div>
																</div>
																<div class="SummonerName">
																	<a href="//www.op.gg/summoner/userName=Hide+on+bush"
																		class="Link" target="_blank">Hide on bush</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-2 tip"
																		title="아칼리">아칼리</div>
																	<div class="Image20 __sprite __spc20 __spc20-2 tip"
																		title="아칼리">아칼리</div>
																</div>
																<div class="SummonerName">
																	<a
																		href="//www.op.gg/summoner/userName=%ED%8E%A9%EC%8B%9C%EB%A8%B9%EC%A7%80%EB%A7%88%EB%9D%BC"
																		class="Link" target="_blank">펩시먹지마라</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-15 tip"
																		title="케이틀린">케이틀린</div>
																	<div class="Image20 __sprite __spc20 __spc20-15 tip"
																		title="케이틀린">케이틀린</div>
																</div>
																<div class="SummonerName">
																	<a href="//www.op.gg/summoner/userName=Verit4s"
																		class="Link" target="_blank">Verit4s</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-120 tip"
																		title="쓰레쉬">쓰레쉬</div>
																	<div class="Image20 __sprite __spc20 __spc20-120 tip"
																		title="쓰레쉬">쓰레쉬</div>
																</div>
																<div class="SummonerName">
																	<a href="//www.op.gg/summoner/userName=BlackSurvival2"
																		class="Link" target="_blank">BlackSurvival2</a>
																</div>
															</div>
														</div>
													</div>
													<div class="StatsButton">
														<div class="Content">
															<div class="Item">
																<a id="right_match_replay" href="#"
																	class="Button Replay OpenSpectateButton"> <span
																	class="__spSite __spSite-159"></span></a>
															</div>
															<div class="Item">
																<a id="right_match" href="#" class="Button MatchDetail">
																	<span class="__spSite __spSite-198 Off"></span> <span
																	class="__spSite __spSite-197 On"></span>
																</a>
															</div>
														</div>
													</div>
												</div>
												<div class="GameDetail"></div>
											</div>
										</div>
										<div class="GameItemWrap">
											<div class="GameItem Win  " data-summoner-id="4460427"
												data-game-time="1599462155" data-game-id="4629811410"
												data-game-result="win">
												<div class="Content">
													<div class="GameStats">
														<div class="GameType" title="솔랭">솔랭</div>
														<div class="TimeStamp">
															<span class="_timeago _timeCountAssigned tip"
																data-datetime="1599462155" data-type=""
																data-interval="60" title="2020년 9월 7일 오후 4시 25분">17시간
																전</span>
														</div>
														<div class="Bar"></div>
														<div class="GameResult">승리</div>
														<div class="GameLength">16분 1초</div>

													</div>
													<div class="GameSettingInfo">
														<div class="ChampionImage">
															<a href="/champion/irelia/statistics" target="_blank"><img
																src="//opgg-static.akamaized.net/images/lol/champion/Irelia.png?image=q_auto,w_46&amp;v=1596679559"
																class="Image" alt="이렐리아"></a>
														</div>

														<div class="SummonerSpell">
															<div class="Spell">
																<img
																	src="//opgg-static.akamaized.net/images/lol/spell/SummonerTeleport.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #ffc659'>순간이동</b><br><span>4초 동안 정신을 집중한 다음, 챔피언이 지정한 아군 구조물, 미니언, 혹은 와드로 순간이동하고 이동 속도가 증가합니다. 순간이동의 재사용 대기시간은 챔피언 레벨에 따라 420~240초입니다.</span>"
																	alt="순간이동">
															</div>
															<div class="Spell">
																<img
																	src="//opgg-static.akamaized.net/images/lol/spell/SummonerFlash.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #ffc659'>점멸</b><br><span>커서 방향으로 챔피언이 짧은 거리를 순간이동합니다.</span>"
																	alt="점멸">
															</div>
														</div>
														<div class="Runes">
															<div class="Rune">
																<img
																	src="//opgg-static.akamaized.net/images/lol/perk/8010.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #ffc659'>정복자</b><br><span>적 챔피언에게 기본 공격 또는 스킬로 피해를 입히면 6초 동안 정복자 중첩을 2만큼 얻어 중첩마다 1.7~4.2의 <lol-uikit-tooltipped-keyword key='LinkTooltip_Description_Adaptive'><font color='#48C4B7'>적응형 능력치</font></lol-uikit-tooltipped-keyword>를 얻습니다. 최대 12회까지 중첩됩니다. 원거리 챔피언은 기본 공격으로 중첩을 1만 획득할 수 있습니다.<br><br>최대로 중첩되면 챔피언에게 입힌 피해량의 15%만큼 체력을 회복합니다. (원거리 챔피언은 8%)</span>"
																	alt="정복자">
															</div>
															<div class="Rune">
																<img
																	src="//opgg-static.akamaized.net/images/lol/perkStyle/8300.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #ffc659'>영감</b><br><span>다양한 방식의 전투 보조</span>"
																	alt="영감">
															</div>
														</div>
														<div class="ChampionName">
															<a href="/champion/irelia/statistics" target="_blank">이렐리아</a>
														</div>
													</div>
													<div class="KDA">
														<div class="KDA">
															<span class="Kill">3</span> / <span class="Death">2</span>
															/ <span class="Assist">5</span>
														</div>
														<div class="KDARatio">
															<span class="KDARatio ">4.00:1</span> 평점
														</div>
														<div class="Badge">
															<span class="Text MVP">MVP</span>
														</div>
													</div>
													<div class="Stats">
														<div class="Level">레벨11</div>
														<div class="CS">
															<span class="CS tip"
																title="미니언 129  + 몬스터 0<br>분당CS 8.1개">129 (8.1)</span>
															CS
														</div>
														<div class="CKRate tip" title="킬관여율">킬관여 35%</div>
														<div class="MMR">
															<span>매치 평균</span> <br> <b>Grandmaster</b>
														</div>
													</div>
													<div class="Items">
														<div class="ItemList">
															<div class="Item">
																<img
																	src="//opgg-static.akamaized.net/images/lol/item/3153.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #00cfbc'>몰락한 왕의 검</b><br><span>상대의 체력에 비례하여 피해를 입히고, 상대의 이동 속도를 훔칠 수 있습니다.</span><br><span><stats>공격력 +40<br>공격 속도 +25%<br>생명력 흡수 +12%</stats><br><br><unique>고유 지속 효과:</unique> 기본 공격 적중 시 대상 현재 체력의 8%에 해당하는 추가 물리 피해를 입힙니다. (근접 챔피언은 12%)<br><active>고유 사용 효과:</active> 적 챔피언에게 100의 마법 피해를 입히고, 3초 동안 대상 이동 속도의 25%를 훔칩니다. (재사용 대기시간 90초)<br><br><rules>최소 15의 추가 물리 피해를 입힙니다.<br>몬스터 및 미니언에게 최대 60의 추가 물리 피해를 입힙니다.<br>사용자의 생명력 흡수가 입힌 추가 물리 피해에 적용됩니다.</rules></span><br><span>가격:</span> <span style='color: #ffc659'>3300 (700)</span>"
																	alt="몰락한 왕의 검">
															</div>
															<div class="Item">
																<img
																	src="//opgg-static.akamaized.net/images/lol/item/2033.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #00cfbc'>부패 물약</b><br><span>체력과 마나가 일정 시간 동안 회복되고 전투 능력을 상승시킵니다. 상점에 가면 다시 충전됩니다.</span><br><span><groupLimit>한 번에 한 종류의 회복 물약만 소지할 수 있습니다.</groupLimit><br><br><active>고유 사용 효과:</active> 충전량을 1회 소모해 12초 동안 125의 체력과 75의 마나를 회복하고, 그 동안 <font color='#FF8811'><u>부패의 손길</u></font>을 활성화합니다. 상점 방문 시 3회의 충전량이 다시 채워집니다.<br><br><font color='#FF8811'><u>부패의 손길:</u></font> 적 챔피언에게 주문 및 공격으로 피해를 입히면 적을 불태워 3초 동안 15의 마법 피해를 입힙니다. (광역 및 지속 피해 스킬 사용 시에는 피해의 50%만 적용됩니다. 피해량은 챔피언 레벨에 비례해 증가합니다.)<br><br><rules>(부패 물약은 체력과 마나가 모두 차 있을 때도 사용할 수 있습니다.)</rules></span><br><span>가격:</span> <span style='color: #ffc659'>500 (350)</span>"
																	alt="부패 물약">
															</div>
															<div class="Item">
																<img
																	src="//opgg-static.akamaized.net/images/lol/item/2055.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #00cfbc'>제어 와드</b><br><span>일정 지역 안의 와드와 투명 덫을 무력화시킵니다.</span><br><span><groupLimit>제어 와드는 가방에 2개만 소지할 수 있습니다.</groupLimit><br><br><consumable>클릭하여 사용:</consumable> 주변 지역을 드러내 주는 와드를 설치합니다. 근처의 투명한 덫과 와드를 드러내고, 추가로 와드를 무력화시킵니다. 위장 중인 유닛의 모습도 드러냅니다. 하지만 제어 와드로 다른 제어 와드를 무력화시킬 수는 없습니다.<br><br>플레이어 당 맵에 설치할 수 있는 <font color='#BBFFFF'>제어 와드</font>의 개수는  1개로 제한됩니다.</span><br><span>가격:</span> <span style='color: #ffc659'>75 (75)</span>"
																	alt="제어 와드">
															</div>
															<div class="Item">
																<img
																	src="//opgg-static.akamaized.net/images/lol/item/3340.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #00cfbc'>와드 토템 (장신구)</b><br><span>주기적으로 투명 와드를 설치합니다.</span><br><span><groupLimit>장신구 소지 개수는 1개로 제한됩니다.</groupLimit><br><br><active>사용 시:</active> 충전량을 1회 소모하여 <scaleLevel>90 ~ 120</scaleLevel>초 동안 주변을 드러내 주는 보이지 않는 <font color='#BBFFFF'>투명 와드</font>를 설치합니다. <br><br>매 <scaleLevel>240 ~ 120</scaleLevel>초마다 1회 충전되며 최대 2회까지 충전됩니다.<br><br>와드 지속시간과 충전 주기는 레벨이 오를수록 향상됩니다.<br><br><rules>(플레이어당 맵에 설치할 수 있는 <font color='#BBFFFF'>투명 와드</font>는 3개로 제한됩니다.)</rules></span>"
																	alt="와드 토템 (장신구)">
															</div>
															<div class="Item">
																<img
																	src="//opgg-static.akamaized.net/images/lol/item/3111.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #00cfbc'>헤르메스의 발걸음</b><br><span>이동 속도가 증가하고, 방해 효과의 지속시간이 줄어듭니다.</span><br><span><groupLimit>1개만 구입 가능합니다.</groupLimit><br><br><stats>마법 저항력 +25</stats><br><br><unique>고유 지속 효과 - 이동 속도 향상:</unique> 이동 속도 +45<br><unique>고유 지속 효과 - 강인함:</unique> 기절, 둔화, 도발, 공포, 침묵, 실명, 변이 및 이동 불가 효과의 지속시간이 30% 감소합니다.</span><br><span>가격:</span> <span style='color: #ffc659'>1100 (350)</span>"
																	alt="헤르메스의 발걸음">
															</div>
															<div class="Item">
																<img
																	src="//opgg-static.akamaized.net/images/lol/item/1028.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #00cfbc'>루비 수정</b><br><span>체력이 증가합니다.</span><br><span><stats>체력 +150</stats></span><br><span>가격:</span> <span style='color: #ffc659'>400 (400)</span>"
																	alt="루비 수정">
															</div>
															<div class="Item">
																<div class="Image NoItem"></div>
															</div>
															<button class="Button OpenBuildButton tip" title="빌드"
																type="button">
																<img class="On"
																	src="//opgg-static.akamaized.net/css3/sprite/images/icon-buildblue-p.png">
																<img class="Off"
																	src="//opgg-static.akamaized.net/css3/sprite/images/icon-buildblue-p.png">
															</button>
														</div>
														<div class="Trinket">
															<img
																src="//opgg-static.akamaized.net/images/site/summoner/icon-ward-blue.png">
															제어 와드 <span class="wards vision">4</span>
														</div>
													</div>
													<div class="FollowPlayers Names">
														<div class="Team">
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-66 tip"
																		title="루시안">루시안</div>
																	<div class="Image20 __sprite __spc20 __spc20-66 tip"
																		title="루시안">루시안</div>
																</div>
																<div class="SummonerName">
																	<a href="//www.op.gg/summoner/userName=T1+Roach"
																		class="Link" target="_blank">T1 Roach</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-64 tip"
																		title="릴리아">릴리아</div>
																	<div class="Image20 __sprite __spc20 __spc20-64 tip"
																		title="릴리아">릴리아</div>
																</div>
																<div class="SummonerName">
																	<a href="//www.op.gg/summoner/userName=kongyouzixin"
																		class="Link" target="_blank">kongyouzixin</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-148 tip"
																		title="조이">조이</div>
																	<div class="Image20 __sprite __spc20 __spc20-148 tip"
																		title="조이">조이</div>
																</div>
																<div class="SummonerName">
																	<a href="//www.op.gg/summoner/userName=T1+Roamer"
																		class="Link" target="_blank">T1 Roamer</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-8 tip"
																		title="애쉬">애쉬</div>
																	<div class="Image20 __sprite __spc20 __spc20-8 tip"
																		title="애쉬">애쉬</div>
																</div>
																<div class="SummonerName">
																	<a
																		href="//www.op.gg/summoner/userName=EM+%EC%83%81%EC%96%B4"
																		class="Link" target="_blank">EM 상어</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-120 tip"
																		title="쓰레쉬">쓰레쉬</div>
																	<div class="Image20 __sprite __spc20 __spc20-120 tip"
																		title="쓰레쉬">쓰레쉬</div>
																</div>
																<div class="SummonerName">
																	<a
																		href="//www.op.gg/summoner/userName=EM+%ED%95%91%ED%81%AC%EB%8F%BC%EC%A7%80"
																		class="Link" target="_blank">EM 핑크돼지</a>
																</div>
															</div>
														</div>
														<div class="Team">
															<div class="Summoner Requester">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-40 tip"
																		title="이렐리아">이렐리아</div>
																	<div class="Image20 __sprite __spc20 __spc20-40 tip"
																		title="이렐리아">이렐리아</div>
																</div>
																<div class="SummonerName">
																	<a href="//www.op.gg/summoner/userName=Hide+on+bush"
																		class="Link" target="_blank">Hide on bush</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-26 tip"
																		title="이블린">이블린</div>
																	<div class="Image20 __sprite __spc20 __spc20-26 tip"
																		title="이블린">이블린</div>
																</div>
																<div class="SummonerName">
																	<a href="//www.op.gg/summoner/userName=Gen+G+Clid"
																		class="Link" target="_blank">Gen G Clid</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-16 tip"
																		title="카밀">카밀</div>
																	<div class="Image20 __sprite __spc20 __spc20-16 tip"
																		title="카밀">카밀</div>
																</div>
																<div class="SummonerName">
																	<a href="//www.op.gg/summoner/userName=Yaw+nuY"
																		class="Link" target="_blank">Yaw nuY</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-46 tip"
																		title="진">진</div>
																	<div class="Image20 __sprite __spc20 __spc20-46 tip"
																		title="진">진</div>
																</div>
																<div class="SummonerName">
																	<a href="//www.op.gg/summoner/userName=HLE+Viper"
																		class="Link" target="_blank">HLE Viper</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-149 tip"
																		title="자이라">자이라</div>
																	<div class="Image20 __sprite __spc20 __spc20-149 tip"
																		title="자이라">자이라</div>
																</div>
																<div class="SummonerName">
																	<a href="//www.op.gg/summoner/userName=black+svvan"
																		class="Link" target="_blank">black svvan</a>
																</div>
															</div>
														</div>
													</div>
													<div class="StatsButton">
														<div class="Content">
															<div class="Item">
																<a id="right_match_replay" href="#"
																	class="Button Replay OpenSpectateButton"> <span
																	class="__spSite __spSite-159"></span></a>
															</div>
															<div class="Item">
																<a id="right_match" href="#" class="Button MatchDetail">
																	<span class="__spSite __spSite-194 Off"></span> <span
																	class="__spSite __spSite-193 On"></span>
																</a>
															</div>
														</div>
													</div>
												</div>
												<div class="GameDetail"></div>
											</div>
										</div>
										<div class="GameItemWrap">
											<div class="GameItem Win  " data-summoner-id="4460427"
												data-game-time="1599419206" data-game-id="4629181888"
												data-game-result="win">
												<div class="Content">
													<div class="GameStats">
														<div class="GameType" title="솔랭">솔랭</div>
														<div class="TimeStamp">
															<span class="_timeago _timeCountAssigned tip"
																data-datetime="1599419206" data-type=""
																data-interval="60" title="2020년 9월 7일 오전 4시 29분">하루
																전</span>
														</div>
														<div class="Bar"></div>
														<div class="GameResult">승리</div>
														<div class="GameLength">23분 49초</div>

													</div>
													<div class="GameSettingInfo">
														<div class="ChampionImage">
															<a href="/champion/lucian/statistics" target="_blank"><img
																src="//opgg-static.akamaized.net/images/lol/champion/Lucian.png?image=q_auto,w_46&amp;v=1596679559"
																class="Image" alt="루시안"></a>
														</div>

														<div class="SummonerSpell">
															<div class="Spell">
																<img
																	src="//opgg-static.akamaized.net/images/lol/spell/SummonerBoost.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #ffc659'>정화</b><br><span>챔피언에 걸린 모든 이동 불가와 (제압 및 공중으로 띄우는 효과 제외) 소환사 주문에 의한 해로운 효과를 제거하고 새로 적용되는 이동 불가 효과들의 지속시간을 3초간 65% 감소시킵니다.</span>"
																	alt="정화">
															</div>
															<div class="Spell">
																<img
																	src="//opgg-static.akamaized.net/images/lol/spell/SummonerFlash.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #ffc659'>점멸</b><br><span>커서 방향으로 챔피언이 짧은 거리를 순간이동합니다.</span>"
																	alt="점멸">
															</div>
														</div>
														<div class="Runes">
															<div class="Rune">
																<img
																	src="//opgg-static.akamaized.net/images/lol/perk/8005.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #ffc659'>집중 공격</b><br><span>적 챔피언에게 연속으로 3회 기본 공격을 가하면 레벨에 따라 40 ~ 180의 추가 <lol-uikit-tooltipped-keyword key='LinkTooltip_Description_AdaptiveDmg'><font color='#48C4B7'>적응형 피해</font></lol-uikit-tooltipped-keyword>를 입히고 적의 약점을 노출시킵니다. 약점이 노출된 적은 6초 동안 모든 상대에게서 8 ~ 12%의 추가 피해를 받습니다.</span>"
																	alt="집중 공격">
															</div>
															<div class="Rune">
																<img
																	src="//opgg-static.akamaized.net/images/lol/perkStyle/8300.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #ffc659'>영감</b><br><span>다양한 방식의 전투 보조</span>"
																	alt="영감">
															</div>
														</div>
														<div class="ChampionName">
															<a href="/champion/lucian/statistics" target="_blank">루시안</a>
														</div>
													</div>
													<div class="KDA">
														<div class="KDA">
															<span class="Kill">3</span> / <span class="Death">8</span>
															/ <span class="Assist">7</span>
														</div>
														<div class="KDARatio">
															<span class="KDARatio ">1.25:1</span> 평점
														</div>
													</div>
													<div class="Stats">
														<div class="Level">레벨13</div>
														<div class="CS">
															<span class="CS tip"
																title="미니언 145  + 몬스터 10<br>분당CS 6.5개">155 (6.5)</span>
															CS
														</div>
														<div class="CKRate tip" title="킬관여율">킬관여 40%</div>
														<div class="MMR">
															<span>매치 평균</span> <br> <b>Grandmaster</b>
														</div>
													</div>
													<div class="Items">
														<div class="ItemList">
															<div class="Item">
																<img
																	src="//opgg-static.akamaized.net/images/lol/item/3153.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #00cfbc'>몰락한 왕의 검</b><br><span>상대의 체력에 비례하여 피해를 입히고, 상대의 이동 속도를 훔칠 수 있습니다.</span><br><span><stats>공격력 +40<br>공격 속도 +25%<br>생명력 흡수 +12%</stats><br><br><unique>고유 지속 효과:</unique> 기본 공격 적중 시 대상 현재 체력의 8%에 해당하는 추가 물리 피해를 입힙니다. (근접 챔피언은 12%)<br><active>고유 사용 효과:</active> 적 챔피언에게 100의 마법 피해를 입히고, 3초 동안 대상 이동 속도의 25%를 훔칩니다. (재사용 대기시간 90초)<br><br><rules>최소 15의 추가 물리 피해를 입힙니다.<br>몬스터 및 미니언에게 최대 60의 추가 물리 피해를 입힙니다.<br>사용자의 생명력 흡수가 입힌 추가 물리 피해에 적용됩니다.</rules></span><br><span>가격:</span> <span style='color: #ffc659'>3300 (700)</span>"
																	alt="몰락한 왕의 검">
															</div>
															<div class="Item">
																<img
																	src="//opgg-static.akamaized.net/images/lol/item/2033.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #00cfbc'>부패 물약</b><br><span>체력과 마나가 일정 시간 동안 회복되고 전투 능력을 상승시킵니다. 상점에 가면 다시 충전됩니다.</span><br><span><groupLimit>한 번에 한 종류의 회복 물약만 소지할 수 있습니다.</groupLimit><br><br><active>고유 사용 효과:</active> 충전량을 1회 소모해 12초 동안 125의 체력과 75의 마나를 회복하고, 그 동안 <font color='#FF8811'><u>부패의 손길</u></font>을 활성화합니다. 상점 방문 시 3회의 충전량이 다시 채워집니다.<br><br><font color='#FF8811'><u>부패의 손길:</u></font> 적 챔피언에게 주문 및 공격으로 피해를 입히면 적을 불태워 3초 동안 15의 마법 피해를 입힙니다. (광역 및 지속 피해 스킬 사용 시에는 피해의 50%만 적용됩니다. 피해량은 챔피언 레벨에 비례해 증가합니다.)<br><br><rules>(부패 물약은 체력과 마나가 모두 차 있을 때도 사용할 수 있습니다.)</rules></span><br><span>가격:</span> <span style='color: #ffc659'>500 (350)</span>"
																	alt="부패 물약">
															</div>
															<div class="Item">
																<div class="Image NoItem"></div>
															</div>
															<div class="Item">
																<img
																	src="//opgg-static.akamaized.net/images/lol/item/3363.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #00cfbc'>망원형 개조</b><br><span>설치 범위가 증가하며 대상 지역을 드러내 줍니다.</span><br><span><levelLimit>업그레이드하려면 9레벨 이상이 되어야 합니다.</levelLimit><br><groupLimit>장신구 소지 개수는 1개로 제한됩니다.</groupLimit><br><br><font color='#FFFFFF'>와드 토템</font> 장신구 업그레이드 시:<br><br><stats><font color='#00FF00'>+</font> 설치 가능 범위 대폭(+650%) 증가<br><font color='#00FF00'>+</font> 지속시간 제한 없음, 와드 설치 개수 제한에 관계 없음<br><font color='#FF0000'>-</font> <font color='#FF6600'>재사용 대기시간 10% 증가</font><br><font color='#FF0000'>-</font> <font color='#FF6600'>누구나 볼 수 있는 와드로, 파괴 가능하고 아군의 대상으로 지정 불가</font><br><font color='#FF0000'>-</font> <font color='#FF6600'>와드 시야 범위 45% 감소</font><br><font color='#FF0000'>-</font> <font color='#FF6600'>상점 방문 시 충전되지 않음</font></stats></span>"
																	alt="망원형 개조">
															</div>
															<div class="Item">
																<img
																	src="//opgg-static.akamaized.net/images/lol/item/3071.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #00cfbc'>칠흑의 양날 도끼</b><br><span>적 챔피언에게 물리 피해를 입히면 적의 방어력이 감소합니다.</span><br><span><stats>체력 +400<br>공격력 +40<br>재사용 대기시간 감소 +20%</stats><br><br><unique>고유 지속 효과:</unique> 적 챔피언에게 물리 피해를 입히면 대상을 베어, 6초 동안 방어력을 4% 감소시킵니다. (최대 6번, 24%까지 중첩)<br><unique>고유 지속 효과 - 격분:</unique> 물리 피해를 입히면 2초 동안 이동 속도가 20 상승합니다. 베어낸 적 챔피언의 처치를 돕거나 어떤 유닛이든 처치하면 대신 2초 동안 이동 속도가 60 상승합니다. 원거리 챔피언은 이 이동 속도의 절반만 상승합니다.</span><br><span>가격:</span> <span style='color: #ffc659'>3000 (950)</span>"
																	alt="칠흑의 양날 도끼">
															</div>
															<div class="Item">
																<img
																	src="//opgg-static.akamaized.net/images/lol/item/3006.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #00cfbc'>광전사의 군화</b><br><span>이동 속도와 공격 속도가 상승합니다.</span><br><span><groupLimit>1개만 구입 가능합니다.</groupLimit><br><br><stats> 공격 속도 +35%</stats><br><br><unique>고유 지속 효과 - 이동 속도 향상:</unique> 이동 속도 +45</span><br><span>가격:</span> <span style='color: #ffc659'>1100 (500)</span>"
																	alt="광전사의 군화">
															</div>
															<div class="Item">
																<div class="Image NoItem"></div>
															</div>
															<button class="Button OpenBuildButton tip" title="빌드"
																type="button">
																<img class="On"
																	src="//opgg-static.akamaized.net/css3/sprite/images/icon-buildblue-p.png">
																<img class="Off"
																	src="//opgg-static.akamaized.net/css3/sprite/images/icon-buildblue-p.png">
															</button>
														</div>
														<div class="Trinket">
															<img
																src="//opgg-static.akamaized.net/images/site/summoner/icon-ward-blue.png">
															제어 와드 <span class="wards vision">7</span>
														</div>
													</div>
													<div class="FollowPlayers Names">
														<div class="Team">
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-67 tip"
																		title="룰루">룰루</div>
																	<div class="Image20 __sprite __spc20 __spc20-67 tip"
																		title="룰루">룰루</div>
																</div>
																<div class="SummonerName">
																	<a
																		href="//www.op.gg/summoner/userName=%EC%8B%9C+%EB%9F%AC"
																		class="Link" target="_blank">시 러</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-58 tip"
																		title="킨드레드">킨드레드</div>
																	<div class="Image20 __sprite __spc20 __spc20-58 tip"
																		title="킨드레드">킨드레드</div>
																</div>
																<div class="SummonerName">
																	<a
																		href="//www.op.gg/summoner/userName=%EC%97%B0%ED%8C%A8+%ED%9B%84+%EC%97%B0%EC%8A%B9"
																		class="Link" target="_blank">연패 후 연승</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-86 tip"
																		title="오른">오른</div>
																	<div class="Image20 __sprite __spc20 __spc20-86 tip"
																		title="오른">오른</div>
																</div>
																<div class="SummonerName">
																	<a
																		href="//www.op.gg/summoner/userName=%EB%B2%8C%EA%BF%80%EC%98%A4%EC%86%8C%EB%A6%AC%EC%8B%9D%EB%94%9C%EA%B5%90"
																		class="Link" target="_blank">벌꿀오소리식딜교</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-8 tip"
																		title="애쉬">애쉬</div>
																	<div class="Image20 __sprite __spc20 __spc20-8 tip"
																		title="애쉬">애쉬</div>
																</div>
																<div class="SummonerName">
																	<a
																		href="//www.op.gg/summoner/userName=%EC%A0%80%EB%8A%94%EB%AA%BB%ED%95%B4%EC%9A%94asd"
																		class="Link" target="_blank">저는못해요asd</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-120 tip"
																		title="쓰레쉬">쓰레쉬</div>
																	<div class="Image20 __sprite __spc20 __spc20-120 tip"
																		title="쓰레쉬">쓰레쉬</div>
																</div>
																<div class="SummonerName">
																	<a
																		href="//www.op.gg/summoner/userName=%EC%86%90%EC%8B%9C%EC%9A%B0%EB%B6%84%EC%8B%A0"
																		class="Link" target="_blank">손시우분신</a>
																</div>
															</div>
														</div>
														<div class="Team">
															<div class="Summoner Requester">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-66 tip"
																		title="루시안">루시안</div>
																	<div class="Image20 __sprite __spc20 __spc20-66 tip"
																		title="루시안">루시안</div>
																</div>
																<div class="SummonerName">
																	<a href="//www.op.gg/summoner/userName=Hide+on+bush"
																		class="Link" target="_blank">Hide on bush</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-64 tip"
																		title="릴리아">릴리아</div>
																	<div class="Image20 __sprite __spc20 __spc20-64 tip"
																		title="릴리아">릴리아</div>
																</div>
																<div class="SummonerName">
																	<a
																		href="//www.op.gg/summoner/userName=%EC%97%98+%EB%A6%BC"
																		class="Link" target="_blank">엘 림</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-88 tip"
																		title="뽀삐">뽀삐</div>
																	<div class="Image20 __sprite __spc20 __spc20-88 tip"
																		title="뽀삐">뽀삐</div>
																</div>
																<div class="SummonerName">
																	<a
																		href="//www.op.gg/summoner/userName=%EC%9D%B4%EA%B8%B0%EB%8B%A4wzxy"
																		class="Link" target="_blank">이기다wzxy</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-27 tip"
																		title="이즈리얼">이즈리얼</div>
																	<div class="Image20 __sprite __spc20 __spc20-27 tip"
																		title="이즈리얼">이즈리얼</div>
																</div>
																<div class="SummonerName">
																	<a href="//www.op.gg/summoner/userName=HLE+Cheoni"
																		class="Link" target="_blank">HLE Cheoni</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-103 tip"
																		title="샤코">샤코</div>
																	<div class="Image20 __sprite __spc20 __spc20-103 tip"
																		title="샤코">샤코</div>
																</div>
																<div class="SummonerName">
																	<a
																		href="//www.op.gg/summoner/userName=%EB%88%84%EC%9A%B4%EA%B8%B8"
																		class="Link" target="_blank">누운길</a>
																</div>
															</div>
														</div>
													</div>
													<div class="StatsButton">
														<div class="Content">
															<div class="Item">
																<a id="right_match_replay" href="#"
																	class="Button Replay OpenSpectateButton"> <span
																	class="__spSite __spSite-159"></span></a>
															</div>
															<div class="Item">
																<a id="right_match" href="#" class="Button MatchDetail">
																	<span class="__spSite __spSite-194 Off"></span> <span
																	class="__spSite __spSite-193 On"></span>
																</a>
															</div>
														</div>
													</div>
												</div>
												<div class="GameDetail"></div>
											</div>
										</div>
										<div class="GameItemWrap">
											<div class="GameItem Lose  " data-summoner-id="4460427"
												data-game-time="1599417355" data-game-id="4629128107"
												data-game-result="lose">
												<div class="Content">
													<div class="GameStats">
														<div class="GameType" title="솔랭">솔랭</div>
														<div class="TimeStamp">
															<span class="_timeago _timeCountAssigned tip"
																data-datetime="1599417355" data-type=""
																data-interval="60" title="2020년 9월 7일 오전 3시 58분">하루
																전</span>
														</div>
														<div class="Bar"></div>
														<div class="GameResult">패배</div>
														<div class="GameLength">35분 12초</div>

													</div>
													<div class="GameSettingInfo">
														<div class="ChampionImage">
															<a href="/champion/sylas/statistics" target="_blank"><img
																src="//opgg-static.akamaized.net/images/lol/champion/Sylas.png?image=q_auto,w_46&amp;v=1596679559"
																class="Image" alt="사일러스"></a>
														</div>

														<div class="SummonerSpell">
															<div class="Spell">
																<img
																	src="//opgg-static.akamaized.net/images/lol/spell/SummonerTeleport.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #ffc659'>순간이동</b><br><span>4초 동안 정신을 집중한 다음, 챔피언이 지정한 아군 구조물, 미니언, 혹은 와드로 순간이동하고 이동 속도가 증가합니다. 순간이동의 재사용 대기시간은 챔피언 레벨에 따라 420~240초입니다.</span>"
																	alt="순간이동">
															</div>
															<div class="Spell">
																<img
																	src="//opgg-static.akamaized.net/images/lol/spell/SummonerFlash.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #ffc659'>점멸</b><br><span>커서 방향으로 챔피언이 짧은 거리를 순간이동합니다.</span>"
																	alt="점멸">
															</div>
														</div>
														<div class="Runes">
															<div class="Rune">
																<img
																	src="//opgg-static.akamaized.net/images/lol/perk/8021.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #ffc659'>기민한 발놀림</b><br><span>공격 또는 이동 시 충전 중첩이 쌓입니다. 중첩이 100회 쌓이면 충전 상태로 다음 공격을 할 수 있습니다.<br><br>충전 상태로 공격 시 3~60(+추가 공격력의 0.3, +주문력의 0.3)에 해당하는 체력이 회복되며 1초 동안 이동 속도가 20% 증가합니다.<br><br>원거리 챔피언의 경우 미니언으로부터 받는 회복 효과가 20%만 적용됩니다.</span>"
																	alt="기민한 발놀림">
															</div>
															<div class="Rune">
																<img
																	src="//opgg-static.akamaized.net/images/lol/perkStyle/8300.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #ffc659'>영감</b><br><span>다양한 방식의 전투 보조</span>"
																	alt="영감">
															</div>
														</div>
														<div class="ChampionName">
															<a href="/champion/sylas/statistics" target="_blank">사일러스</a>
														</div>
													</div>
													<div class="KDA">
														<div class="KDA">
															<span class="Kill">14</span> / <span class="Death">5</span>
															/ <span class="Assist">7</span>
														</div>
														<div class="KDARatio">
															<span class="KDARatio ">4.20:1</span> 평점
														</div>
														<div class="MultiKill">
															<span class="Kill">더블킬</span>
														</div>
														<div class="Badge">
															<span class="Text ACE">ACE</span>
														</div>
													</div>
													<div class="Stats">
														<div class="Level">레벨17</div>
														<div class="CS">
															<span class="CS tip"
																title="미니언 204  + 몬스터 18<br>분당CS 6.3개">222 (6.3)</span>
															CS
														</div>
														<div class="CKRate tip" title="킬관여율">킬관여 58%</div>
														<div class="MMR">
															<span>매치 평균</span> <br> <b>Grandmaster</b>
														</div>
													</div>
													<div class="Items">
														<div class="ItemList">
															<div class="Item">
																<img
																	src="//opgg-static.akamaized.net/images/lol/item/3030.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #00cfbc'>마법공학 GLP-800</b><br><span>사용하면 얼어붙은 탄환을 발사해 적을 둔화시킵니다.</span><br><span><stats>주문력 +80<br><mana>마나 +600</mana><br>재사용 대기시간 감소 +10%</stats><br><br><unique>고유 지속 효과 - 가속:</unique> 재사용 대기시간이 추가로 10% 감소합니다.<br><unique>고유 사용 효과 - 서리 탄환:</unique> 유닛에게 최초 적중 시 폭발하는 얼음 탄환을 무더기로 발사해 적중하는 모든 적에게 <scaleLevel>100~200</scaleLevel> (+ 주문력의 20%)의 마법 피해를 입힙니다. (재사용 대기시간은 40초이며 다른 <font color='#9999FF'><a href=&quot;#&quot;>마법공학</a></font> 아이템과 재사용 대기시간을 공유합니다.)<br><br>적중당한 적은 65% 둔화되며 둔화 효과는 2초에 걸쳐 사라집니다.</span><br><span>가격:</span> <span style='color: #ffc659'>2800 (450)</span>"
																	alt="마법공학 GLP-800">
															</div>
															<div class="Item">
																<img
																	src="//opgg-static.akamaized.net/images/lol/item/3157.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #00cfbc'>존야의 모래시계</b><br><span>사용하면 아무런 행동도 취할 수 없는 대신 공격도 받지 않는 무적 상태가 됩니다.</span><br><span><stats>주문력 +75<br>방어력 +45<br>재사용 대기시간 감소 +10%</stats><br><br><active>고유 사용 효과 - 경직:</active> 챔피언이 2.5초 동안 아무런 행동도 취할 수 없는 대신 공격도 받지 않는 무적 상태가 됩니다. (재사용 대기시간 120초)</span><br><span>가격:</span> <span style='color: #ffc659'>2900 (250)</span>"
																	alt="존야의 모래시계">
															</div>
															<div class="Item">
																<div class="Image NoItem"></div>
															</div>
															<div class="Item">
																<img
																	src="//opgg-static.akamaized.net/images/lol/item/3363.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #00cfbc'>망원형 개조</b><br><span>설치 범위가 증가하며 대상 지역을 드러내 줍니다.</span><br><span><levelLimit>업그레이드하려면 9레벨 이상이 되어야 합니다.</levelLimit><br><groupLimit>장신구 소지 개수는 1개로 제한됩니다.</groupLimit><br><br><font color='#FFFFFF'>와드 토템</font> 장신구 업그레이드 시:<br><br><stats><font color='#00FF00'>+</font> 설치 가능 범위 대폭(+650%) 증가<br><font color='#00FF00'>+</font> 지속시간 제한 없음, 와드 설치 개수 제한에 관계 없음<br><font color='#FF0000'>-</font> <font color='#FF6600'>재사용 대기시간 10% 증가</font><br><font color='#FF0000'>-</font> <font color='#FF6600'>누구나 볼 수 있는 와드로, 파괴 가능하고 아군의 대상으로 지정 불가</font><br><font color='#FF0000'>-</font> <font color='#FF6600'>와드 시야 범위 45% 감소</font><br><font color='#FF0000'>-</font> <font color='#FF6600'>상점 방문 시 충전되지 않음</font></stats></span>"
																	alt="망원형 개조">
															</div>
															<div class="Item">
																<img
																	src="//opgg-static.akamaized.net/images/lol/item/3020.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip tpd-delegation-uid-1" title=""
																	alt="마법사의 신발">
															</div>
															<div class="Item">
																<img
																	src="//opgg-static.akamaized.net/images/lol/item/3165.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #00cfbc'>모렐로노미콘</b><br><span>마법 피해량이 증가합니다.</span><br><span><stats>주문력 +70<br>체력 +300</stats><br><br><unique>고유 지속 효과- 죽음의 감촉:</unique> <a href=&quot;#&quot;>마법 관통력</a> +15<br><unique>고유 지속 효과- 저주받은 일격:</unique> 챔피언에게 마법 피해를 가하면 3초 동안 <a href=&quot;#&quot;>고통스러운 상처</a> 효과를 적용합니다.</span><br><span>가격:</span> <span style='color: #ffc659'>3000 (550)</span>"
																	alt="모렐로노미콘">
															</div>
															<div class="Item">
																<img
																	src="//opgg-static.akamaized.net/images/lol/item/3089.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #00cfbc'>라바돈의 죽음모자</b><br><span>주문력이 대폭 상승합니다.</span><br><span><stats>주문력 +120  </stats><br><br><unique>고유 지속 효과:</unique> 주문력이 40% 상승합니다.</span><br><span>가격:</span> <span style='color: #ffc659'>3600 (1100)</span>"
																	alt="라바돈의 죽음모자">
															</div>
															<button class="Button OpenBuildButton tip" title="빌드"
																type="button">
																<img class="On"
																	src="//opgg-static.akamaized.net/css3/sprite/images/icon-buildred-p.png">
																<img class="Off"
																	src="//opgg-static.akamaized.net/css3/sprite/images/icon-buildred-p.png">
															</button>
														</div>
														<div class="Trinket">
															<img
																src="//opgg-static.akamaized.net/images/site/summoner/icon-ward-red.png">
															제어 와드 <span class="wards vision">9</span>
														</div>
													</div>
													<div class="FollowPlayers Names">
														<div class="Team">
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-66 tip"
																		title="루시안">루시안</div>
																	<div class="Image20 __sprite __spc20 __spc20-66 tip"
																		title="루시안">루시안</div>
																</div>
																<div class="SummonerName">
																	<a href="//www.op.gg/summoner/userName=znhy"
																		class="Link" target="_blank">znhy</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-102 tip"
																		title="세트">세트</div>
																	<div class="Image20 __sprite __spc20 __spc20-102 tip"
																		title="세트">세트</div>
																</div>
																<div class="SummonerName">
																	<a href="//www.op.gg/summoner/userName=jonghakzz"
																		class="Link" target="_blank">jonghakzz</a>
																</div>
															</div>
															<div class="Summoner Requester">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-113 tip"
																		title="사일러스">사일러스</div>
																	<div class="Image20 __sprite __spc20 __spc20-113 tip"
																		title="사일러스">사일러스</div>
																</div>
																<div class="SummonerName">
																	<a href="//www.op.gg/summoner/userName=Hide+on+bush"
																		class="Link" target="_blank">Hide on bush</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-48 tip"
																		title="카이사">카이사</div>
																	<div class="Image20 __sprite __spc20 __spc20-48 tip"
																		title="카이사">카이사</div>
																</div>
																<div class="SummonerName">
																	<a
																		href="//www.op.gg/summoner/userName=%EC%A0%80%EB%8A%94%EB%AA%BB%ED%95%B4%EC%9A%94asd"
																		class="Link" target="_blank">저는못해요asd</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-104 tip"
																		title="쉔">쉔</div>
																	<div class="Image20 __sprite __spc20 __spc20-104 tip"
																		title="쉔">쉔</div>
																</div>
																<div class="SummonerName">
																	<a href="//www.op.gg/summoner/userName=ehfdkdhsakql"
																		class="Link" target="_blank">ehfdkdhsakql</a>
																</div>
															</div>
														</div>
														<div class="Team">
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-74 tip"
																		title="오공">오공</div>
																	<div class="Image20 __sprite __spc20 __spc20-74 tip"
																		title="오공">오공</div>
																</div>
																<div class="SummonerName">
																	<a
																		href="//www.op.gg/summoner/userName=SSW%EC%9E%A5%ED%98%95%EC%84%9D"
																		class="Link" target="_blank">SSW장형석</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-26 tip"
																		title="이블린">이블린</div>
																	<div class="Image20 __sprite __spc20 __spc20-26 tip"
																		title="이블린">이블린</div>
																</div>
																<div class="SummonerName">
																	<a href="//www.op.gg/summoner/userName=zyb"
																		class="Link" target="_blank">zyb</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-145 tip"
																		title="제드">제드</div>
																	<div class="Image20 __sprite __spc20 __spc20-145 tip"
																		title="제드">제드</div>
																</div>
																<div class="SummonerName">
																	<a href="//www.op.gg/summoner/userName=ZED99"
																		class="Link" target="_blank">ZED99</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-137 tip"
																		title="자야">자야</div>
																	<div class="Image20 __sprite __spc20 __spc20-137 tip"
																		title="자야">자야</div>
																</div>
																<div class="SummonerName">
																	<a href="//www.op.gg/summoner/userName=EM+Envyy"
																		class="Link" target="_blank">EM Envyy</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-92 tip"
																		title="라칸">라칸</div>
																	<div class="Image20 __sprite __spc20 __spc20-92 tip"
																		title="라칸">라칸</div>
																</div>
																<div class="SummonerName">
																	<a href="//www.op.gg/summoner/userName=DFM+GAENG"
																		class="Link" target="_blank">DFM GAENG</a>
																</div>
															</div>
														</div>
													</div>
													<div class="StatsButton">
														<div class="Content">
															<div class="Item">
																<a id="right_match_replay" href="#"
																	class="Button Replay OpenSpectateButton"> <span
																	class="__spSite __spSite-159"></span></a>
															</div>
															<div class="Item">
																<a id="right_match" href="#" class="Button MatchDetail">
																	<span class="__spSite __spSite-198 Off"></span> <span
																	class="__spSite __spSite-197 On"></span>
																</a>
															</div>
														</div>
													</div>
												</div>
												<div class="GameDetail"></div>
											</div>
										</div>
										<div class="GameItemWrap">
											<div class="GameItem Lose  " data-summoner-id="4460427"
												data-game-time="1599414767" data-game-id="4629134245"
												data-game-result="lose">
												<div class="Content">
													<div class="GameStats">
														<div class="GameType" title="솔랭">솔랭</div>
														<div class="TimeStamp">
															<span class="_timeago _timeCountAssigned tip"
																data-datetime="1599414767" data-type=""
																data-interval="60" title="2020년 9월 7일 오전 3시 15분">하루
																전</span>
														</div>
														<div class="Bar"></div>
														<div class="GameResult">패배</div>
														<div class="GameLength">33분 39초</div>

													</div>
													<div class="GameSettingInfo">
														<div class="ChampionImage">
															<a href="/champion/kennen/statistics" target="_blank"><img
																src="//opgg-static.akamaized.net/images/lol/champion/Kennen.png?image=q_auto,w_46&amp;v=1596679559"
																class="Image" alt="케넨"></a>
														</div>

														<div class="SummonerSpell">
															<div class="Spell">
																<img
																	src="//opgg-static.akamaized.net/images/lol/spell/SummonerTeleport.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #ffc659'>순간이동</b><br><span>4초 동안 정신을 집중한 다음, 챔피언이 지정한 아군 구조물, 미니언, 혹은 와드로 순간이동하고 이동 속도가 증가합니다. 순간이동의 재사용 대기시간은 챔피언 레벨에 따라 420~240초입니다.</span>"
																	alt="순간이동">
															</div>
															<div class="Spell">
																<img
																	src="//opgg-static.akamaized.net/images/lol/spell/SummonerFlash.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #ffc659'>점멸</b><br><span>커서 방향으로 챔피언이 짧은 거리를 순간이동합니다.</span>"
																	alt="점멸">
															</div>
														</div>
														<div class="Runes">
															<div class="Rune">
																<img
																	src="//opgg-static.akamaized.net/images/lol/perk/8010.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #ffc659'>정복자</b><br><span>적 챔피언에게 기본 공격 또는 스킬로 피해를 입히면 6초 동안 정복자 중첩을 2만큼 얻어 중첩마다 1.7~4.2의 <lol-uikit-tooltipped-keyword key='LinkTooltip_Description_Adaptive'><font color='#48C4B7'>적응형 능력치</font></lol-uikit-tooltipped-keyword>를 얻습니다. 최대 12회까지 중첩됩니다. 원거리 챔피언은 기본 공격으로 중첩을 1만 획득할 수 있습니다.<br><br>최대로 중첩되면 챔피언에게 입힌 피해량의 15%만큼 체력을 회복합니다. (원거리 챔피언은 8%)</span>"
																	alt="정복자">
															</div>
															<div class="Rune">
																<img
																	src="//opgg-static.akamaized.net/images/lol/perkStyle/8100.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #ffc659'>지배</b><br><span>강력한 피해와 빠른 접근</span>"
																	alt="지배">
															</div>
														</div>
														<div class="ChampionName">
															<a href="/champion/kennen/statistics" target="_blank">케넨</a>
														</div>
													</div>
													<div class="KDA">
														<div class="KDA">
															<span class="Kill">11</span> / <span class="Death">4</span>
															/ <span class="Assist">4</span>
														</div>
														<div class="KDARatio">
															<span class="KDARatio ">3.75:1</span> 평점
														</div>
														<div class="Badge">
															<span class="Text ACE">ACE</span>
														</div>
													</div>
													<div class="Stats">
														<div class="Level">레벨16</div>
														<div class="CS">
															<span class="CS tip"
																title="미니언 207  + 몬스터 16<br>분당CS 6.6개">223 (6.6)</span>
															CS
														</div>
														<div class="CKRate tip" title="킬관여율">킬관여 68%</div>
														<div class="MMR">
															<span>매치 평균</span> <br> <b>Grandmaster</b>
														</div>
													</div>
													<div class="Items">
														<div class="ItemList">
															<div class="Item">
																<img
																	src="//opgg-static.akamaized.net/images/lol/item/3146.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip tpd-delegation-uid-1" title=""
																	alt="마법공학 총검">
															</div>
															<div class="Item">
																<img
																	src="//opgg-static.akamaized.net/images/lol/item/3157.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #00cfbc'>존야의 모래시계</b><br><span>사용하면 아무런 행동도 취할 수 없는 대신 공격도 받지 않는 무적 상태가 됩니다.</span><br><span><stats>주문력 +75<br>방어력 +45<br>재사용 대기시간 감소 +10%</stats><br><br><active>고유 사용 효과 - 경직:</active> 챔피언이 2.5초 동안 아무런 행동도 취할 수 없는 대신 공격도 받지 않는 무적 상태가 됩니다. (재사용 대기시간 120초)</span><br><span>가격:</span> <span style='color: #ffc659'>2900 (250)</span>"
																	alt="존야의 모래시계">
															</div>
															<div class="Item">
																<div class="Image NoItem"></div>
															</div>
															<div class="Item">
																<img
																	src="//opgg-static.akamaized.net/images/lol/item/3363.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #00cfbc'>망원형 개조</b><br><span>설치 범위가 증가하며 대상 지역을 드러내 줍니다.</span><br><span><levelLimit>업그레이드하려면 9레벨 이상이 되어야 합니다.</levelLimit><br><groupLimit>장신구 소지 개수는 1개로 제한됩니다.</groupLimit><br><br><font color='#FFFFFF'>와드 토템</font> 장신구 업그레이드 시:<br><br><stats><font color='#00FF00'>+</font> 설치 가능 범위 대폭(+650%) 증가<br><font color='#00FF00'>+</font> 지속시간 제한 없음, 와드 설치 개수 제한에 관계 없음<br><font color='#FF0000'>-</font> <font color='#FF6600'>재사용 대기시간 10% 증가</font><br><font color='#FF0000'>-</font> <font color='#FF6600'>누구나 볼 수 있는 와드로, 파괴 가능하고 아군의 대상으로 지정 불가</font><br><font color='#FF0000'>-</font> <font color='#FF6600'>와드 시야 범위 45% 감소</font><br><font color='#FF0000'>-</font> <font color='#FF6600'>상점 방문 시 충전되지 않음</font></stats></span>"
																	alt="망원형 개조">
															</div>
															<div class="Item">
																<img
																	src="//opgg-static.akamaized.net/images/lol/item/3020.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip tpd-delegation-uid-1" title=""
																	alt="마법사의 신발">
															</div>
															<div class="Item">
																<img
																	src="//opgg-static.akamaized.net/images/lol/item/3165.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #00cfbc'>모렐로노미콘</b><br><span>마법 피해량이 증가합니다.</span><br><span><stats>주문력 +70<br>체력 +300</stats><br><br><unique>고유 지속 효과- 죽음의 감촉:</unique> <a href=&quot;#&quot;>마법 관통력</a> +15<br><unique>고유 지속 효과- 저주받은 일격:</unique> 챔피언에게 마법 피해를 가하면 3초 동안 <a href=&quot;#&quot;>고통스러운 상처</a> 효과를 적용합니다.</span><br><span>가격:</span> <span style='color: #ffc659'>3000 (550)</span>"
																	alt="모렐로노미콘">
															</div>
															<div class="Item">
																<img
																	src="//opgg-static.akamaized.net/images/lol/item/3135.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #00cfbc'>공허의 지팡이</b><br><span>마법 피해량이 증가합니다.</span><br><span><stats>주문력 +70</stats><br><br><unique>고유 지속 효과 - 분해:</unique> <a href=&quot;#&quot;>마법 관통력</a> +40%</span><br><span>가격:</span> <span style='color: #ffc659'>2650 (1365)</span>"
																	alt="공허의 지팡이">
															</div>
															<button class="Button OpenBuildButton tip" title="빌드"
																type="button">
																<img class="On"
																	src="//opgg-static.akamaized.net/css3/sprite/images/icon-buildred-p.png">
																<img class="Off"
																	src="//opgg-static.akamaized.net/css3/sprite/images/icon-buildred-p.png">
															</button>
														</div>
														<div class="Trinket">
															<img
																src="//opgg-static.akamaized.net/images/site/summoner/icon-ward-red.png">
															제어 와드 <span class="wards vision">8</span>
														</div>
													</div>
													<div class="FollowPlayers Names">
														<div class="Team">
															<div class="Summoner Requester">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-56 tip"
																		title="케넨">케넨</div>
																	<div class="Image20 __sprite __spc20 __spc20-56 tip"
																		title="케넨">케넨</div>
																</div>
																<div class="SummonerName">
																	<a href="//www.op.gg/summoner/userName=Hide+on+bush"
																		class="Link" target="_blank">Hide on bush</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-93 tip"
																		title="람머스">람머스</div>
																	<div class="Image20 __sprite __spc20 __spc20-93 tip"
																		title="람머스">람머스</div>
																</div>
																<div class="SummonerName">
																	<a
																		href="//www.op.gg/summoner/userName=%EC%95%88%EB%85%95+%EB%82%98%EB%8A%94+%EA%B9%80%EA%BC%AC%EB%B6%81"
																		class="Link" target="_blank">안녕 나는 김꼬북</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-40 tip"
																		title="이렐리아">이렐리아</div>
																	<div class="Image20 __sprite __spc20 __spc20-40 tip"
																		title="이렐리아">이렐리아</div>
																</div>
																<div class="SummonerName">
																	<a href="//www.op.gg/summoner/userName=Ar1a"
																		class="Link" target="_blank">Ar1a</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-66 tip"
																		title="루시안">루시안</div>
																	<div class="Image20 __sprite __spc20 __spc20-66 tip"
																		title="루시안">루시안</div>
																</div>
																<div class="SummonerName">
																	<a
																		href="//www.op.gg/summoner/userName=%EC%A0%80%EB%8A%94%EB%AA%BB%ED%95%B4%EC%9A%94asd"
																		class="Link" target="_blank">저는못해요asd</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-67 tip"
																		title="룰루">룰루</div>
																	<div class="Image20 __sprite __spc20 __spc20-67 tip"
																		title="룰루">룰루</div>
																</div>
																<div class="SummonerName">
																	<a
																		href="//www.op.gg/summoner/userName=%EB%B3%84%EC%82%AC%ED%83%95%EC%9D%B4%EC%A2%8B%EC%95%84%EC%9A%94"
																		class="Link" target="_blank">별사탕이좋아요</a>
																</div>
															</div>
														</div>
														<div class="Team">
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-71 tip"
																		title="마오카이">마오카이</div>
																	<div class="Image20 __sprite __spc20 __spc20-71 tip"
																		title="마오카이">마오카이</div>
																</div>
																<div class="SummonerName">
																	<a
																		href="//www.op.gg/summoner/userName=SSW%EC%9E%A5%ED%98%95%EC%84%9D"
																		class="Link" target="_blank">SSW장형석</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-105 tip"
																		title="쉬바나">쉬바나</div>
																	<div class="Image20 __sprite __spc20 __spc20-105 tip"
																		title="쉬바나">쉬바나</div>
																</div>
																<div class="SummonerName">
																	<a href="//www.op.gg/summoner/userName=zyb"
																		class="Link" target="_blank">zyb</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-102 tip"
																		title="세트">세트</div>
																	<div class="Image20 __sprite __spc20 __spc20-102 tip"
																		title="세트">세트</div>
																</div>
																<div class="SummonerName">
																	<a href="//www.op.gg/summoner/userName=still+in+dream"
																		class="Link" target="_blank">still in dream</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-46 tip"
																		title="진">진</div>
																	<div class="Image20 __sprite __spc20 __spc20-46 tip"
																		title="진">진</div>
																</div>
																<div class="SummonerName">
																	<a
																		href="//www.op.gg/summoner/userName=%EC%A2%80+%ED%98%81"
																		class="Link" target="_blank">좀 혁</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-42 tip"
																		title="잔나">잔나</div>
																	<div class="Image20 __sprite __spc20 __spc20-42 tip"
																		title="잔나">잔나</div>
																</div>
																<div class="SummonerName">
																	<a href="//www.op.gg/summoner/userName=he+jue+xuan"
																		class="Link" target="_blank">he jue xuan</a>
																</div>
															</div>
														</div>
													</div>
													<div class="StatsButton">
														<div class="Content">
															<div class="Item">
																<a id="right_match_replay" href="#"
																	class="Button Replay OpenSpectateButton"> <span
																	class="__spSite __spSite-159"></span></a>
															</div>
															<div class="Item">
																<a id="right_match" href="#" class="Button MatchDetail">
																	<span class="__spSite __spSite-198 Off"></span> <span
																	class="__spSite __spSite-197 On"></span>
																</a>
															</div>
														</div>
													</div>
												</div>
												<div class="GameDetail"></div>
											</div>
										</div>
										<div class="GameItemWrap">
											<div class="GameItem Win  " data-summoner-id="4460427"
												data-game-time="1599411886" data-game-id="4629058440"
												data-game-result="win">
												<div class="Content">
													<div class="GameStats">
														<div class="GameType" title="솔랭">솔랭</div>
														<div class="TimeStamp">
															<span class="_timeago _timeCountAssigned tip"
																data-datetime="1599411886" data-type=""
																data-interval="60" title="2020년 9월 7일 오전 2시 27분">하루
																전</span>
														</div>
														<div class="Bar"></div>
														<div class="GameResult">승리</div>
														<div class="GameLength">34분 19초</div>

													</div>
													<div class="GameSettingInfo">
														<div class="ChampionImage">
															<a href="/champion/blitzcrank/statistics" target="_blank"><img
																src="//opgg-static.akamaized.net/images/lol/champion/Blitzcrank.png?image=q_auto,w_46&amp;v=1596679559"
																class="Image" alt="블리츠크랭크"></a>
														</div>

														<div class="SummonerSpell">
															<div class="Spell">
																<img
																	src="//opgg-static.akamaized.net/images/lol/spell/SummonerDot.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #ffc659'>점화</b><br><span>적 챔피언을 불태워 5초 동안 70~410의 고정 피해(챔피언 레벨에 따라 변동)를 입히고 모습을 드러내며 치료 효과를 감소시킵니다.</span>"
																	alt="점화">
															</div>
															<div class="Spell">
																<img
																	src="//opgg-static.akamaized.net/images/lol/spell/SummonerFlash.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #ffc659'>점멸</b><br><span>커서 방향으로 챔피언이 짧은 거리를 순간이동합니다.</span>"
																	alt="점멸">
															</div>
														</div>
														<div class="Runes">
															<div class="Rune">
																<img
																	src="//opgg-static.akamaized.net/images/lol/perk/8439.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #ffc659'>여진</b><br><span>적을 이동 불가 상태로 만들면 2.5초 동안 35+추가 방어력 및 마법 저항력의 80%만큼 방어력과 마법 저항력이 증가하며 폭발이 일어나 근처 적에게 마법 피해를 줍니다.<br><br>피해량: 25~120 (+추가 체력의 8%)<br>재사용 대기시간: 20초<br><br>여진 추가 저항력: 80~150 (레벨에 비례)<br></span>"
																	alt="여진">
															</div>
															<div class="Rune">
																<img
																	src="//opgg-static.akamaized.net/images/lol/perkStyle/8300.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #ffc659'>영감</b><br><span>다양한 방식의 전투 보조</span>"
																	alt="영감">
															</div>
														</div>
														<div class="ChampionName">
															<a href="/champion/blitzcrank/statistics" target="_blank">블리츠크랭크</a>
														</div>
													</div>
													<div class="KDA">
														<div class="KDA">
															<span class="Kill">7</span> / <span class="Death">5</span>
															/ <span class="Assist">28</span>
														</div>
														<div class="KDARatio">
															<span class="KDARatio ">7.00:1</span> 평점
														</div>
														<div class="MultiKill">
															<span class="Kill">트리플킬</span>
														</div>
														<div class="Badge">
															<span class="Text MVP">MVP</span>
														</div>
													</div>
													<div class="Stats">
														<div class="Level">레벨15</div>
														<div class="CS">
															<span class="CS tip" title="미니언 31  + 몬스터 0<br>분당CS 0.9개">31
																(0.9)</span> CS
														</div>
														<div class="CKRate tip" title="킬관여율">킬관여 74%</div>
														<div class="MMR">
															<span>매치 평균</span> <br> <b>Grandmaster</b>
														</div>
													</div>
													<div class="Items">
														<div class="ItemList">
															<div class="Item">
																<img
																	src="//opgg-static.akamaized.net/images/lol/item/3857.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #00cfbc'>화이트록의 갑옷</b><br><span><stats>체력 +300<br>공격력 +15<br>10초당 골드 +3<br>기본 체력 재생 +100% </stats><br><br><active>고유 사용 효과 - 와드 설치:</active> <font color='#FF9900'>투명 와드</font>를 설치합니다. 상점 방문 시 4회의 충전량이 다시 채워집니다.<br><br><rules>(<a href=&quot;#&quot;>미니언을 너무 많이 처치</a>하면 획득하는 골드가 감소합니다.)</rules></span><br><span>가격:</span> <span style='color: #ffc659'>400 (400)</span>"
																	alt="화이트록의 갑옷">
															</div>
															<div class="Item">
																<img
																	src="//opgg-static.akamaized.net/images/lol/item/3800.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip tpd-delegation-uid-1" title=""
																	alt="정당한 영광">
															</div>
															<div class="Item">
																<img
																	src="//opgg-static.akamaized.net/images/lol/item/3190.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #00cfbc'>강철의 솔라리 펜던트</b><br><span>사용하면 주변 아군을 적의 공격에서 방어해 줍니다.</span><br><span><stats>방어력 +30<br>마법 저항력 +60</stats><br><br><active>고유 사용 효과:</active> 2.5초간 근처 아군 챔피언들을 점차 사라지는 보호막으로 감싸 최대 120 (레벨당 +10) <scaleHealth>(+추가 체력의 20%)</scaleHealth>에 해당하는 피해를 흡수합니다. (재사용 대기시간 120초)<br><br><rules>보호막 레벨은 자기 자신과 대상 중 더 높은 쪽을 기준으로 합니다.<br>보호막 흡수량 %는 레벨에 비례합니다.<br>대상이 지난 20초 안에 다른 챔피언의 강철의 솔라리 펜던트 효과를 받은 경우 효과가 25%로 감소합니다.</rules></span><br><span>가격:</span> <span style='color: #ffc659'>2200 (650)</span>"
																	alt="강철의 솔라리 펜던트">
															</div>
															<div class="Item">
																<img
																	src="//opgg-static.akamaized.net/images/lol/item/3364.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #00cfbc'>예언자의 렌즈</b><br><span>근처의 투명한 와드와 덫을 일정 시간 동안 차단합니다.</span><br><span><groupLimit>장신구 소지 개수는 1개로 제한됩니다.</groupLimit><br><br><active>사용 시:</active> 10초 동안 근처를 수색해 적 유닛이 숨어 있으면 경고를 보내며 주변의 투명한 덫과 와드를 드러내고, 추가로 와드를 무력화시킵니다. (재사용 대기시간 90~60초)</span>"
																	alt="예언자의 렌즈">
															</div>
															<div class="Item">
																<div class="Image NoItem"></div>
															</div>
															<div class="Item">
																<img
																	src="//opgg-static.akamaized.net/images/lol/item/3117.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip tpd-delegation-uid-1" title=""
																	alt="기동력의 장화">
															</div>
															<div class="Item">
																<img
																	src="//opgg-static.akamaized.net/images/lol/item/3109.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #00cfbc'>기사의 맹세</b><br><span>동료를 지정해 서로를 보호합니다.</span><br><span><stats>체력 +250<br>방어력 +40<br>재사용 대기시간 감소 +10%</stats><br><br><active>고유 사용 효과:</active> 아군 챔피언을 <a href=&quot;#&quot;>동료</a>로 지정합니다. (재사용 대기시간 90초)<br><passive>고유 지속 효과:</passive> <a href=&quot;#&quot;>동료</a>가 근처에 있으면 방어력이 추가로 +20 상승하고 해당 챔피언에게 가까이 갈 때 이동 속도가 +15% 빨라집니다.<br><passive>고유 지속 효과:</passive> <a href=&quot;#&quot;>동료</a>가 근처에 있으면 <a href=&quot;#&quot;>동료</a>가 적 챔피언에게 입힌 피해의 12%만큼 체력을 회복하고, <a href=&quot;#&quot;>동료</a>가 적 챔피언으로부터 입는 피해의 12%를 <font color='#FFFFFF'>고정</font> 피해로 대신 입습니다. (원거리 챔피언의 경우 체력 회복량과 대신 입는 피해량이 50% 감소합니다.)<br><br><rules>(한 번에 한 명의 챔피언만 기사의 맹세로 연결될 수 있습니다.)</rules></span><br><span>가격:</span> <span style='color: #ffc659'>2200 (600)</span>"
																	alt="기사의 맹세">
															</div>
															<button class="Button OpenBuildButton tip" title="빌드"
																type="button">
																<img class="On"
																	src="//opgg-static.akamaized.net/css3/sprite/images/icon-buildblue-p.png">
																<img class="Off"
																	src="//opgg-static.akamaized.net/css3/sprite/images/icon-buildblue-p.png">
															</button>
														</div>
														<div class="Trinket">
															<img
																src="//opgg-static.akamaized.net/images/site/summoner/icon-ward-blue.png">
															제어 와드 <span class="wards vision">12</span>
														</div>
													</div>
													<div class="FollowPlayers Names">
														<div class="Team">
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-86 tip"
																		title="오른">오른</div>
																	<div class="Image20 __sprite __spc20 __spc20-86 tip"
																		title="오른">오른</div>
																</div>
																<div class="SummonerName">
																	<a href="//www.op.gg/summoner/userName=E1aina"
																		class="Link" target="_blank">E1aina</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-58 tip"
																		title="킨드레드">킨드레드</div>
																	<div class="Image20 __sprite __spc20 __spc20-58 tip"
																		title="킨드레드">킨드레드</div>
																</div>
																<div class="SummonerName">
																	<a
																		href="//www.op.gg/summoner/userName=%EB%A9%98%ED%83%88%EC%9E%A1%EC%9E%90%EC%9C%BC%EC%8C%B0%EC%9C%BC%EC%8C%B0"
																		class="Link" target="_blank">멘탈잡자으쌰으쌰</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-53 tip"
																		title="카타리나">카타리나</div>
																	<div class="Image20 __sprite __spc20 __spc20-53 tip"
																		title="카타리나">카타리나</div>
																</div>
																<div class="SummonerName">
																	<a href="//www.op.gg/summoner/userName=WOWWBS"
																		class="Link" target="_blank">WOWWBS</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-101 tip"
																		title="세나">세나</div>
																	<div class="Image20 __sprite __spc20 __spc20-101 tip"
																		title="세나">세나</div>
																</div>
																<div class="SummonerName">
																	<a href="//www.op.gg/summoner/userName=UECA2"
																		class="Link" target="_blank">UECA2</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-120 tip"
																		title="쓰레쉬">쓰레쉬</div>
																	<div class="Image20 __sprite __spc20 __spc20-120 tip"
																		title="쓰레쉬">쓰레쉬</div>
																</div>
																<div class="SummonerName">
																	<a href="//www.op.gg/summoner/userName=deng+wo+lv16"
																		class="Link" target="_blank">deng wo lv16</a>
																</div>
															</div>
														</div>
														<div class="Team">
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-95 tip"
																		title="레넥톤">레넥톤</div>
																	<div class="Image20 __sprite __spc20 __spc20-95 tip"
																		title="레넥톤">레넥톤</div>
																</div>
																<div class="SummonerName">
																	<a href="//www.op.gg/summoner/userName=Apolosius"
																		class="Link" target="_blank">Apolosius</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-51 tip"
																		title="카서스">카서스</div>
																	<div class="Image20 __sprite __spc20 __spc20-51 tip"
																		title="카서스">카서스</div>
																</div>
																<div class="SummonerName">
																	<a
																		href="//www.op.gg/summoner/userName=%EA%B0%95%EC%A3%BC%EC%97%B0"
																		class="Link" target="_blank">강주연</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-2 tip"
																		title="아칼리">아칼리</div>
																	<div class="Image20 __sprite __spc20 __spc20-2 tip"
																		title="아칼리">아칼리</div>
																</div>
																<div class="SummonerName">
																	<a href="//www.op.gg/summoner/userName=dansawangzhe"
																		class="Link" target="_blank">dansawangzhe</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-66 tip"
																		title="루시안">루시안</div>
																	<div class="Image20 __sprite __spc20 __spc20-66 tip"
																		title="루시안">루시안</div>
																</div>
																<div class="SummonerName">
																	<a
																		href="//www.op.gg/summoner/userName=%EC%A0%80%EB%8A%94%EB%AA%BB%ED%95%B4%EC%9A%94asd"
																		class="Link" target="_blank">저는못해요asd</a>
																</div>
															</div>
															<div class="Summoner Requester">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-12 tip"
																		title="블리츠크랭크">블리츠크랭크</div>
																	<div class="Image20 __sprite __spc20 __spc20-12 tip"
																		title="블리츠크랭크">블리츠크랭크</div>
																</div>
																<div class="SummonerName">
																	<a href="//www.op.gg/summoner/userName=Hide+on+bush"
																		class="Link" target="_blank">Hide on bush</a>
																</div>
															</div>
														</div>
													</div>
													<div class="StatsButton">
														<div class="Content">
															<div class="Item">
																<a id="right_match_replay" href="#"
																	class="Button Replay OpenSpectateButton"> <span
																	class="__spSite __spSite-159"></span></a>
															</div>
															<div class="Item">
																<a id="right_match" href="#" class="Button MatchDetail">
																	<span class="__spSite __spSite-194 Off"></span> <span
																	class="__spSite __spSite-193 On"></span>
																</a>
															</div>
														</div>
													</div>
												</div>
												<div class="GameDetail"></div>
											</div>
										</div>
										<div class="GameItemWrap">
											<div class="GameItem Lose  " data-summoner-id="4460427"
												data-game-time="1599408627" data-game-id="4629032284"
												data-game-result="lose">
												<div class="Content">
													<div class="GameStats">
														<div class="GameType" title="솔랭">솔랭</div>
														<div class="TimeStamp">
															<span class="_timeago _timeCountAssigned tip"
																data-datetime="1599408627" data-type=""
																data-interval="60" title="2020년 9월 7일 오전 1시 33분">하루
																전</span>
														</div>
														<div class="Bar"></div>
														<div class="GameResult">패배</div>
														<div class="GameLength">22분 5초</div>

													</div>
													<div class="GameSettingInfo">
														<div class="ChampionImage">
															<a href="/champion/irelia/statistics" target="_blank"><img
																src="//opgg-static.akamaized.net/images/lol/champion/Irelia.png?image=q_auto,w_46&amp;v=1596679559"
																class="Image" alt="이렐리아"></a>
														</div>

														<div class="SummonerSpell">
															<div class="Spell">
																<img
																	src="//opgg-static.akamaized.net/images/lol/spell/SummonerTeleport.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #ffc659'>순간이동</b><br><span>4초 동안 정신을 집중한 다음, 챔피언이 지정한 아군 구조물, 미니언, 혹은 와드로 순간이동하고 이동 속도가 증가합니다. 순간이동의 재사용 대기시간은 챔피언 레벨에 따라 420~240초입니다.</span>"
																	alt="순간이동">
															</div>
															<div class="Spell">
																<img
																	src="//opgg-static.akamaized.net/images/lol/spell/SummonerFlash.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #ffc659'>점멸</b><br><span>커서 방향으로 챔피언이 짧은 거리를 순간이동합니다.</span>"
																	alt="점멸">
															</div>
														</div>
														<div class="Runes">
															<div class="Rune">
																<img
																	src="//opgg-static.akamaized.net/images/lol/perk/8005.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #ffc659'>집중 공격</b><br><span>적 챔피언에게 연속으로 3회 기본 공격을 가하면 레벨에 따라 40 ~ 180의 추가 <lol-uikit-tooltipped-keyword key='LinkTooltip_Description_AdaptiveDmg'><font color='#48C4B7'>적응형 피해</font></lol-uikit-tooltipped-keyword>를 입히고 적의 약점을 노출시킵니다. 약점이 노출된 적은 6초 동안 모든 상대에게서 8 ~ 12%의 추가 피해를 받습니다.</span>"
																	alt="집중 공격">
															</div>
															<div class="Rune">
																<img
																	src="//opgg-static.akamaized.net/images/lol/perkStyle/8300.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #ffc659'>영감</b><br><span>다양한 방식의 전투 보조</span>"
																	alt="영감">
															</div>
														</div>
														<div class="ChampionName">
															<a href="/champion/irelia/statistics" target="_blank">이렐리아</a>
														</div>
													</div>
													<div class="KDA">
														<div class="KDA">
															<span class="Kill">2</span> / <span class="Death">6</span>
															/ <span class="Assist">2</span>
														</div>
														<div class="KDARatio">
															<span class="KDARatio ">0.67:1</span> 평점
														</div>
														<div class="Badge">
															<span class="Text ACE">ACE</span>
														</div>
													</div>
													<div class="Stats">
														<div class="Level">레벨13</div>
														<div class="CS">
															<span class="CS tip"
																title="미니언 215  + 몬스터 0<br>분당CS 9.7개">215 (9.7)</span>
															CS
														</div>
														<div class="CKRate tip" title="킬관여율">킬관여 50%</div>
														<div class="MMR">
															<span>매치 평균</span> <br> <b>Grandmaster</b>
														</div>
													</div>
													<div class="Items">
														<div class="ItemList">
															<div class="Item">
																<img
																	src="//opgg-static.akamaized.net/images/lol/item/3153.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #00cfbc'>몰락한 왕의 검</b><br><span>상대의 체력에 비례하여 피해를 입히고, 상대의 이동 속도를 훔칠 수 있습니다.</span><br><span><stats>공격력 +40<br>공격 속도 +25%<br>생명력 흡수 +12%</stats><br><br><unique>고유 지속 효과:</unique> 기본 공격 적중 시 대상 현재 체력의 8%에 해당하는 추가 물리 피해를 입힙니다. (근접 챔피언은 12%)<br><active>고유 사용 효과:</active> 적 챔피언에게 100의 마법 피해를 입히고, 3초 동안 대상 이동 속도의 25%를 훔칩니다. (재사용 대기시간 90초)<br><br><rules>최소 15의 추가 물리 피해를 입힙니다.<br>몬스터 및 미니언에게 최대 60의 추가 물리 피해를 입힙니다.<br>사용자의 생명력 흡수가 입힌 추가 물리 피해에 적용됩니다.</rules></span><br><span>가격:</span> <span style='color: #ffc659'>3300 (700)</span>"
																	alt="몰락한 왕의 검">
															</div>
															<div class="Item">
																<img
																	src="//opgg-static.akamaized.net/images/lol/item/2033.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #00cfbc'>부패 물약</b><br><span>체력과 마나가 일정 시간 동안 회복되고 전투 능력을 상승시킵니다. 상점에 가면 다시 충전됩니다.</span><br><span><groupLimit>한 번에 한 종류의 회복 물약만 소지할 수 있습니다.</groupLimit><br><br><active>고유 사용 효과:</active> 충전량을 1회 소모해 12초 동안 125의 체력과 75의 마나를 회복하고, 그 동안 <font color='#FF8811'><u>부패의 손길</u></font>을 활성화합니다. 상점 방문 시 3회의 충전량이 다시 채워집니다.<br><br><font color='#FF8811'><u>부패의 손길:</u></font> 적 챔피언에게 주문 및 공격으로 피해를 입히면 적을 불태워 3초 동안 15의 마법 피해를 입힙니다. (광역 및 지속 피해 스킬 사용 시에는 피해의 50%만 적용됩니다. 피해량은 챔피언 레벨에 비례해 증가합니다.)<br><br><rules>(부패 물약은 체력과 마나가 모두 차 있을 때도 사용할 수 있습니다.)</rules></span><br><span>가격:</span> <span style='color: #ffc659'>500 (350)</span>"
																	alt="부패 물약">
															</div>
															<div class="Item">
																<img
																	src="//opgg-static.akamaized.net/images/lol/item/2055.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #00cfbc'>제어 와드</b><br><span>일정 지역 안의 와드와 투명 덫을 무력화시킵니다.</span><br><span><groupLimit>제어 와드는 가방에 2개만 소지할 수 있습니다.</groupLimit><br><br><consumable>클릭하여 사용:</consumable> 주변 지역을 드러내 주는 와드를 설치합니다. 근처의 투명한 덫과 와드를 드러내고, 추가로 와드를 무력화시킵니다. 위장 중인 유닛의 모습도 드러냅니다. 하지만 제어 와드로 다른 제어 와드를 무력화시킬 수는 없습니다.<br><br>플레이어 당 맵에 설치할 수 있는 <font color='#BBFFFF'>제어 와드</font>의 개수는  1개로 제한됩니다.</span><br><span>가격:</span> <span style='color: #ffc659'>75 (75)</span>"
																	alt="제어 와드">
															</div>
															<div class="Item">
																<img
																	src="//opgg-static.akamaized.net/images/lol/item/3340.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #00cfbc'>와드 토템 (장신구)</b><br><span>주기적으로 투명 와드를 설치합니다.</span><br><span><groupLimit>장신구 소지 개수는 1개로 제한됩니다.</groupLimit><br><br><active>사용 시:</active> 충전량을 1회 소모하여 <scaleLevel>90 ~ 120</scaleLevel>초 동안 주변을 드러내 주는 보이지 않는 <font color='#BBFFFF'>투명 와드</font>를 설치합니다. <br><br>매 <scaleLevel>240 ~ 120</scaleLevel>초마다 1회 충전되며 최대 2회까지 충전됩니다.<br><br>와드 지속시간과 충전 주기는 레벨이 오를수록 향상됩니다.<br><br><rules>(플레이어당 맵에 설치할 수 있는 <font color='#BBFFFF'>투명 와드</font>는 3개로 제한됩니다.)</rules></span>"
																	alt="와드 토템 (장신구)">
															</div>
															<div class="Item">
																<img
																	src="//opgg-static.akamaized.net/images/lol/item/3111.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #00cfbc'>헤르메스의 발걸음</b><br><span>이동 속도가 증가하고, 방해 효과의 지속시간이 줄어듭니다.</span><br><span><groupLimit>1개만 구입 가능합니다.</groupLimit><br><br><stats>마법 저항력 +25</stats><br><br><unique>고유 지속 효과 - 이동 속도 향상:</unique> 이동 속도 +45<br><unique>고유 지속 효과 - 강인함:</unique> 기절, 둔화, 도발, 공포, 침묵, 실명, 변이 및 이동 불가 효과의 지속시간이 30% 감소합니다.</span><br><span>가격:</span> <span style='color: #ffc659'>1100 (350)</span>"
																	alt="헤르메스의 발걸음">
															</div>
															<div class="Item">
																<img
																	src="//opgg-static.akamaized.net/images/lol/item/3067.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #00cfbc'>점화석</b><br><span>체력과 재사용 대기시간 감소량이 증가합니다.</span><br><span><stats>체력 +200  </stats><br><br><unique>고유 지속 효과:</unique> 재사용 대기시간 감소 +10%</span><br><span>가격:</span> <span style='color: #ffc659'>800 (400)</span>"
																	alt="점화석">
															</div>
															<div class="Item">
																<img
																	src="//opgg-static.akamaized.net/images/lol/item/1055.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #00cfbc'>도란의 검</b><br><span>공격에 특화된 시작 아이템입니다.</span><br><span><stats>공격력 +8<br>체력 +80<br>생명력 흡수 +3%</stats></span><br><span>가격:</span> <span style='color: #ffc659'>450 (450)</span>"
																	alt="도란의 검">
															</div>
															<button class="Button OpenBuildButton tip" title="빌드"
																type="button">
																<img class="On"
																	src="//opgg-static.akamaized.net/css3/sprite/images/icon-buildred-p.png">
																<img class="Off"
																	src="//opgg-static.akamaized.net/css3/sprite/images/icon-buildred-p.png">
															</button>
														</div>
														<div class="Trinket">
															<img
																src="//opgg-static.akamaized.net/images/site/summoner/icon-ward-red.png">
															제어 와드 <span class="wards vision">3</span>
														</div>
													</div>
													<div class="FollowPlayers Names">
														<div class="Team">
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-123 tip"
																		title="트린다미어">트린다미어</div>
																	<div class="Image20 __sprite __spc20 __spc20-123 tip"
																		title="트린다미어">트린다미어</div>
																</div>
																<div class="SummonerName">
																	<a href="//www.op.gg/summoner/userName=kfo"
																		class="Link" target="_blank">kfo</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-37 tip"
																		title="헤카림">헤카림</div>
																	<div class="Image20 __sprite __spc20 __spc20-37 tip"
																		title="헤카림">헤카림</div>
																</div>
																<div class="SummonerName">
																	<a
																		href="//www.op.gg/summoner/userName=%EC%95%84%EB%9D%BC%EA%B0%80%ED%82%A4+%EC%9C%A0%EC%9D%B4"
																		class="Link" target="_blank">아라가키 유이</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-30 tip"
																		title="피즈">피즈</div>
																	<div class="Image20 __sprite __spc20 __spc20-30 tip"
																		title="피즈">피즈</div>
																</div>
																<div class="SummonerName">
																	<a href="//www.op.gg/summoner/userName=cautious+mid"
																		class="Link" target="_blank">cautious mid</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-8 tip"
																		title="애쉬">애쉬</div>
																	<div class="Image20 __sprite __spc20 __spc20-8 tip"
																		title="애쉬">애쉬</div>
																</div>
																<div class="SummonerName">
																	<a href="//www.op.gg/summoner/userName=024aetcal"
																		class="Link" target="_blank">024aetcal</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-120 tip"
																		title="쓰레쉬">쓰레쉬</div>
																	<div class="Image20 __sprite __spc20 __spc20-120 tip"
																		title="쓰레쉬">쓰레쉬</div>
																</div>
																<div class="SummonerName">
																	<a href="//www.op.gg/summoner/userName=Sry+Sup+Gap+ToT"
																		class="Link" target="_blank">Sry Sup Gap ToT</a>
																</div>
															</div>
														</div>
														<div class="Team">
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-93 tip"
																		title="람머스">람머스</div>
																	<div class="Image20 __sprite __spc20 __spc20-93 tip"
																		title="람머스">람머스</div>
																</div>
																<div class="SummonerName">
																	<a
																		href="//www.op.gg/summoner/userName=%EC%95%88%EB%85%95+%EB%82%98%EB%8A%94+%EA%B9%80%EA%BC%AC%EB%B6%81"
																		class="Link" target="_blank">안녕 나는 김꼬북</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-81 tip"
																		title="니달리">니달리</div>
																	<div class="Image20 __sprite __spc20 __spc20-81 tip"
																		title="니달리">니달리</div>
																</div>
																<div class="SummonerName">
																	<a href="//www.op.gg/summoner/userName=qe0firugdfvi"
																		class="Link" target="_blank">qe0firugdfvi</a>
																</div>
															</div>
															<div class="Summoner Requester">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-40 tip"
																		title="이렐리아">이렐리아</div>
																	<div class="Image20 __sprite __spc20 __spc20-40 tip"
																		title="이렐리아">이렐리아</div>
																</div>
																<div class="SummonerName">
																	<a href="//www.op.gg/summoner/userName=Hide+on+bush"
																		class="Link" target="_blank">Hide on bush</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-27 tip"
																		title="이즈리얼">이즈리얼</div>
																	<div class="Image20 __sprite __spc20 __spc20-27 tip"
																		title="이즈리얼">이즈리얼</div>
																</div>
																<div class="SummonerName">
																	<a href="//www.op.gg/summoner/userName=DGA+Rahel"
																		class="Link" target="_blank">DGA Rahel</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-11 tip"
																		title="바드">바드</div>
																	<div class="Image20 __sprite __spc20 __spc20-11 tip"
																		title="바드">바드</div>
																</div>
																<div class="SummonerName">
																	<a href="//www.op.gg/summoner/userName=Sup2020"
																		class="Link" target="_blank">Sup2020</a>
																</div>
															</div>
														</div>
													</div>
													<div class="StatsButton">
														<div class="Content">
															<div class="Item">
																<a id="right_match_replay" href="#"
																	class="Button Replay OpenSpectateButton"> <span
																	class="__spSite __spSite-159"></span></a>
															</div>
															<div class="Item">
																<a id="right_match" href="#" class="Button MatchDetail">
																	<span class="__spSite __spSite-198 Off"></span> <span
																	class="__spSite __spSite-197 On"></span>
																</a>
															</div>
														</div>
													</div>
												</div>
												<div class="GameDetail"></div>
											</div>
										</div>
										<div class="GameItemWrap">
											<div class="GameItem Win  " data-summoner-id="4460427"
												data-game-time="1599364771" data-game-id="4626856161"
												data-game-result="win">
												<div class="Content">
													<div class="GameStats">
														<div class="GameType" title="솔랭">솔랭</div>
														<div class="TimeStamp">
															<span class="_timeago _timeCountAssigned tip"
																data-datetime="1599364771" data-type=""
																data-interval="60" title="2020년 9월 6일 오후 1시 22분">2일
																전</span>
														</div>
														<div class="Bar"></div>
														<div class="GameResult">승리</div>
														<div class="GameLength">15분 15초</div>

													</div>
													<div class="GameSettingInfo">
														<div class="ChampionImage">
															<a href="/champion/lucian/statistics" target="_blank"><img
																src="//opgg-static.akamaized.net/images/lol/champion/Lucian.png?image=q_auto,w_46&amp;v=1596679559"
																class="Image" alt="루시안"></a>
														</div>

														<div class="SummonerSpell">
															<div class="Spell">
																<img
																	src="//opgg-static.akamaized.net/images/lol/spell/SummonerBoost.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #ffc659'>정화</b><br><span>챔피언에 걸린 모든 이동 불가와 (제압 및 공중으로 띄우는 효과 제외) 소환사 주문에 의한 해로운 효과를 제거하고 새로 적용되는 이동 불가 효과들의 지속시간을 3초간 65% 감소시킵니다.</span>"
																	alt="정화">
															</div>
															<div class="Spell">
																<img
																	src="//opgg-static.akamaized.net/images/lol/spell/SummonerFlash.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #ffc659'>점멸</b><br><span>커서 방향으로 챔피언이 짧은 거리를 순간이동합니다.</span>"
																	alt="점멸">
															</div>
														</div>
														<div class="Runes">
															<div class="Rune">
																<img
																	src="//opgg-static.akamaized.net/images/lol/perk/8005.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #ffc659'>집중 공격</b><br><span>적 챔피언에게 연속으로 3회 기본 공격을 가하면 레벨에 따라 40 ~ 180의 추가 <lol-uikit-tooltipped-keyword key='LinkTooltip_Description_AdaptiveDmg'><font color='#48C4B7'>적응형 피해</font></lol-uikit-tooltipped-keyword>를 입히고 적의 약점을 노출시킵니다. 약점이 노출된 적은 6초 동안 모든 상대에게서 8 ~ 12%의 추가 피해를 받습니다.</span>"
																	alt="집중 공격">
															</div>
															<div class="Rune">
																<img
																	src="//opgg-static.akamaized.net/images/lol/perkStyle/8300.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #ffc659'>영감</b><br><span>다양한 방식의 전투 보조</span>"
																	alt="영감">
															</div>
														</div>
														<div class="ChampionName">
															<a href="/champion/lucian/statistics" target="_blank">루시안</a>
														</div>
													</div>
													<div class="KDA">
														<div class="KDA">
															<span class="Kill">5</span> / <span class="Death">1</span>
															/ <span class="Assist">2</span>
														</div>
														<div class="KDARatio">
															<span class="KDARatio ">7.00:1</span> 평점
														</div>
													</div>
													<div class="Stats">
														<div class="Level">레벨12</div>
														<div class="CS">
															<span class="CS tip"
																title="미니언 140  + 몬스터 0<br>분당CS 9.2개">140 (9.2)</span>
															CS
														</div>
														<div class="CKRate tip" title="킬관여율">킬관여 35%</div>
														<div class="MMR">
															<span>매치 평균</span> <br> <b>Master</b>
														</div>
													</div>
													<div class="Items">
														<div class="ItemList">
															<div class="Item">
																<img
																	src="//opgg-static.akamaized.net/images/lol/item/3153.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #00cfbc'>몰락한 왕의 검</b><br><span>상대의 체력에 비례하여 피해를 입히고, 상대의 이동 속도를 훔칠 수 있습니다.</span><br><span><stats>공격력 +40<br>공격 속도 +25%<br>생명력 흡수 +12%</stats><br><br><unique>고유 지속 효과:</unique> 기본 공격 적중 시 대상 현재 체력의 8%에 해당하는 추가 물리 피해를 입힙니다. (근접 챔피언은 12%)<br><active>고유 사용 효과:</active> 적 챔피언에게 100의 마법 피해를 입히고, 3초 동안 대상 이동 속도의 25%를 훔칩니다. (재사용 대기시간 90초)<br><br><rules>최소 15의 추가 물리 피해를 입힙니다.<br>몬스터 및 미니언에게 최대 60의 추가 물리 피해를 입힙니다.<br>사용자의 생명력 흡수가 입힌 추가 물리 피해에 적용됩니다.</rules></span><br><span>가격:</span> <span style='color: #ffc659'>3300 (700)</span>"
																	alt="몰락한 왕의 검">
															</div>
															<div class="Item">
																<img
																	src="//opgg-static.akamaized.net/images/lol/item/2055.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #00cfbc'>제어 와드</b><br><span>일정 지역 안의 와드와 투명 덫을 무력화시킵니다.</span><br><span><groupLimit>제어 와드는 가방에 2개만 소지할 수 있습니다.</groupLimit><br><br><consumable>클릭하여 사용:</consumable> 주변 지역을 드러내 주는 와드를 설치합니다. 근처의 투명한 덫과 와드를 드러내고, 추가로 와드를 무력화시킵니다. 위장 중인 유닛의 모습도 드러냅니다. 하지만 제어 와드로 다른 제어 와드를 무력화시킬 수는 없습니다.<br><br>플레이어 당 맵에 설치할 수 있는 <font color='#BBFFFF'>제어 와드</font>의 개수는  1개로 제한됩니다.</span><br><span>가격:</span> <span style='color: #ffc659'>75 (75)</span>"
																	alt="제어 와드">
															</div>
															<div class="Item">
																<img
																	src="//opgg-static.akamaized.net/images/lol/item/3006.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #00cfbc'>광전사의 군화</b><br><span>이동 속도와 공격 속도가 상승합니다.</span><br><span><groupLimit>1개만 구입 가능합니다.</groupLimit><br><br><stats> 공격 속도 +35%</stats><br><br><unique>고유 지속 효과 - 이동 속도 향상:</unique> 이동 속도 +45</span><br><span>가격:</span> <span style='color: #ffc659'>1100 (500)</span>"
																	alt="광전사의 군화">
															</div>
															<div class="Item">
																<img
																	src="//opgg-static.akamaized.net/images/lol/item/3340.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #00cfbc'>와드 토템 (장신구)</b><br><span>주기적으로 투명 와드를 설치합니다.</span><br><span><groupLimit>장신구 소지 개수는 1개로 제한됩니다.</groupLimit><br><br><active>사용 시:</active> 충전량을 1회 소모하여 <scaleLevel>90 ~ 120</scaleLevel>초 동안 주변을 드러내 주는 보이지 않는 <font color='#BBFFFF'>투명 와드</font>를 설치합니다. <br><br>매 <scaleLevel>240 ~ 120</scaleLevel>초마다 1회 충전되며 최대 2회까지 충전됩니다.<br><br>와드 지속시간과 충전 주기는 레벨이 오를수록 향상됩니다.<br><br><rules>(플레이어당 맵에 설치할 수 있는 <font color='#BBFFFF'>투명 와드</font>는 3개로 제한됩니다.)</rules></span>"
																	alt="와드 토템 (장신구)">
															</div>
															<div class="Item">
																<img
																	src="//opgg-static.akamaized.net/images/lol/item/1038.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #00cfbc'>B.F. 대검</b><br><span>공격력이 대폭 증가합니다.</span><br><span><stats>공격력 +40</stats></span><br><span>가격:</span> <span style='color: #ffc659'>1300 (1300)</span>"
																	alt="B.F. 대검">
															</div>
															<div class="Item">
																<img
																	src="//opgg-static.akamaized.net/images/lol/item/1055.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #00cfbc'>도란의 검</b><br><span>공격에 특화된 시작 아이템입니다.</span><br><span><stats>공격력 +8<br>체력 +80<br>생명력 흡수 +3%</stats></span><br><span>가격:</span> <span style='color: #ffc659'>450 (450)</span>"
																	alt="도란의 검">
															</div>
															<div class="Item">
																<img
																	src="//opgg-static.akamaized.net/images/lol/item/1083.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #00cfbc'>수확의 낫</b><br><span>피해를 입히고 적중 시 생명력을 흡수합니다. 미니언 처치 시 추가 골드를 얻습니다.</span><br><span><stats>공격력 +7<br>적중 시 생명력 흡수 +3</stats><br><br><unique>고유 지속 효과:</unique> 공격로 미니언 처치 시 추가로 1 골드를 얻습니다. 공격로 미니언을 총 100회 처치하면 즉시 350의 추가 골드를 얻고 고유 지속 효과가 비활성화됩니다.</span><br><span>가격:</span> <span style='color: #ffc659'>450 (450)</span>"
																	alt="수확의 낫">
															</div>
															<button class="Button OpenBuildButton tip" title="빌드"
																type="button">
																<img class="On"
																	src="//opgg-static.akamaized.net/css3/sprite/images/icon-buildblue-p.png">
																<img class="Off"
																	src="//opgg-static.akamaized.net/css3/sprite/images/icon-buildblue-p.png">
															</button>
														</div>
														<div class="Trinket">
															<img
																src="//opgg-static.akamaized.net/images/site/summoner/icon-ward-blue.png">
															제어 와드 <span class="wards vision">2</span>
														</div>
													</div>
													<div class="FollowPlayers Names">
														<div class="Team">
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-102 tip"
																		title="세트">세트</div>
																	<div class="Image20 __sprite __spc20 __spc20-102 tip"
																		title="세트">세트</div>
																</div>
																<div class="SummonerName">
																	<a
																		href="//www.op.gg/summoner/userName=%EC%A0%B1+%EA%B8%80"
																		class="Link" target="_blank">젱 글</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-51 tip"
																		title="카서스">카서스</div>
																	<div class="Image20 __sprite __spc20 __spc20-51 tip"
																		title="카서스">카서스</div>
																</div>
																<div class="SummonerName">
																	<a
																		href="//www.op.gg/summoner/userName=conglintufupp888"
																		class="Link" target="_blank">conglintufupp888</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-131 tip"
																		title="벨코즈">벨코즈</div>
																	<div class="Image20 __sprite __spc20 __spc20-131 tip"
																		title="벨코즈">벨코즈</div>
																</div>
																<div class="SummonerName">
																	<a
																		href="//www.op.gg/summoner/userName=%EC%97%98%EC%82%AC+%EC%A0%95%EB%A0%B9"
																		class="Link" target="_blank">엘사 정령</a>
																</div>
															</div>
															<div class="Summoner Requester">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-66 tip"
																		title="루시안">루시안</div>
																	<div class="Image20 __sprite __spc20 __spc20-66 tip"
																		title="루시안">루시안</div>
																</div>
																<div class="SummonerName">
																	<a href="//www.op.gg/summoner/userName=Hide+on+bush"
																		class="Link" target="_blank">Hide on bush</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-11 tip"
																		title="바드">바드</div>
																	<div class="Image20 __sprite __spc20 __spc20-11 tip"
																		title="바드">바드</div>
																</div>
																<div class="SummonerName">
																	<a
																		href="//www.op.gg/summoner/userName=%EB%B0%94+%EB%93%9C+%EB%B3%B8+%EC%A2%8C"
																		class="Link" target="_blank">바 드 본 좌</a>
																</div>
															</div>
														</div>
														<div class="Team">
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-75 tip"
																		title="모데카이저">모데카이저</div>
																	<div class="Image20 __sprite __spc20 __spc20-75 tip"
																		title="모데카이저">모데카이저</div>
																</div>
																<div class="SummonerName">
																	<a
																		href="//www.op.gg/summoner/userName=%EB%B2%A0%EC%9D%B8%EC%9E%A5%EC%9D%B8%EC%9A%94%EB%A7%A8"
																		class="Link" target="_blank">베인장인요맨</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-62 tip"
																		title="리 신">리 신</div>
																	<div class="Image20 __sprite __spc20 __spc20-62 tip"
																		title="리 신">리 신</div>
																</div>
																<div class="SummonerName">
																	<a href="//www.op.gg/summoner/userName=AKA+Jugkiller"
																		class="Link" target="_blank">AKA Jugkiller</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-148 tip"
																		title="조이">조이</div>
																	<div class="Image20 __sprite __spc20 __spc20-148 tip"
																		title="조이">조이</div>
																</div>
																<div class="SummonerName">
																	<a
																		href="//www.op.gg/summoner/userName=%EC%A0%9C%EB%B0%9C+%EB%8B%AB%EA%B3%A0+%ED%95%98%EC%9E%90"
																		class="Link" target="_blank">제발 닫고 하자</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-27 tip"
																		title="이즈리얼">이즈리얼</div>
																	<div class="Image20 __sprite __spc20 __spc20-27 tip"
																		title="이즈리얼">이즈리얼</div>
																</div>
																<div class="SummonerName">
																	<a href="//www.op.gg/summoner/userName=NNGG"
																		class="Link" target="_blank">NNGG</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-50 tip"
																		title="카르마">카르마</div>
																	<div class="Image20 __sprite __spc20 __spc20-50 tip"
																		title="카르마">카르마</div>
																</div>
																<div class="SummonerName">
																	<a
																		href="//www.op.gg/summoner/userName=%EC%A4%98%ED%84%B0%EC%A7%80%EB%8A%94%EC%A4%91"
																		class="Link" target="_blank">줘터지는중</a>
																</div>
															</div>
														</div>
													</div>
													<div class="StatsButton">
														<div class="Content">
															<div class="Item">
																<a id="right_match_replay" href="#"
																	class="Button Replay OpenSpectateButton"> <span
																	class="__spSite __spSite-159"></span></a>
															</div>
															<div class="Item">
																<a id="right_match" href="#" class="Button MatchDetail">
																	<span class="__spSite __spSite-194 Off"></span> <span
																	class="__spSite __spSite-193 On"></span>
																</a>
															</div>
														</div>
													</div>
												</div>
												<div class="GameDetail"></div>
											</div>
										</div>
										<div class="GameItemWrap">
											<div class="GameItem Win  " data-summoner-id="4460427"
												data-game-time="1599325556" data-game-id="4626299944"
												data-game-result="win">
												<div class="Content">
													<div class="GameStats">
														<div class="GameType" title="솔랭">솔랭</div>
														<div class="TimeStamp">
															<span class="_timeago _timeCountAssigned tip"
																data-datetime="1599325556" data-type=""
																data-interval="60" title="2020년 9월 6일 오전 2시 28분">2일
																전</span>
														</div>
														<div class="Bar"></div>
														<div class="GameResult">승리</div>
														<div class="GameLength">26분 10초</div>

													</div>
													<div class="GameSettingInfo">
														<div class="ChampionImage">
															<a href="/champion/lucian/statistics" target="_blank"><img
																src="//opgg-static.akamaized.net/images/lol/champion/Lucian.png?image=q_auto,w_46&amp;v=1596679559"
																class="Image" alt="루시안"></a>
														</div>

														<div class="SummonerSpell">
															<div class="Spell">
																<img
																	src="//opgg-static.akamaized.net/images/lol/spell/SummonerBoost.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #ffc659'>정화</b><br><span>챔피언에 걸린 모든 이동 불가와 (제압 및 공중으로 띄우는 효과 제외) 소환사 주문에 의한 해로운 효과를 제거하고 새로 적용되는 이동 불가 효과들의 지속시간을 3초간 65% 감소시킵니다.</span>"
																	alt="정화">
															</div>
															<div class="Spell">
																<img
																	src="//opgg-static.akamaized.net/images/lol/spell/SummonerFlash.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #ffc659'>점멸</b><br><span>커서 방향으로 챔피언이 짧은 거리를 순간이동합니다.</span>"
																	alt="점멸">
															</div>
														</div>
														<div class="Runes">
															<div class="Rune">
																<img
																	src="//opgg-static.akamaized.net/images/lol/perk/8005.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #ffc659'>집중 공격</b><br><span>적 챔피언에게 연속으로 3회 기본 공격을 가하면 레벨에 따라 40 ~ 180의 추가 <lol-uikit-tooltipped-keyword key='LinkTooltip_Description_AdaptiveDmg'><font color='#48C4B7'>적응형 피해</font></lol-uikit-tooltipped-keyword>를 입히고 적의 약점을 노출시킵니다. 약점이 노출된 적은 6초 동안 모든 상대에게서 8 ~ 12%의 추가 피해를 받습니다.</span>"
																	alt="집중 공격">
															</div>
															<div class="Rune">
																<img
																	src="//opgg-static.akamaized.net/images/lol/perkStyle/8300.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #ffc659'>영감</b><br><span>다양한 방식의 전투 보조</span>"
																	alt="영감">
															</div>
														</div>
														<div class="ChampionName">
															<a href="/champion/lucian/statistics" target="_blank">루시안</a>
														</div>
													</div>
													<div class="KDA">
														<div class="KDA">
															<span class="Kill">7</span> / <span class="Death">0</span>
															/ <span class="Assist">5</span>
														</div>
														<div class="KDARatio">
															<span class="KDARatio perfect">Perfect</span> 평점
														</div>
														<div class="MultiKill">
															<span class="Kill">더블킬</span>
														</div>
														<div class="Badge">
															<span class="Text MVP">MVP</span>
														</div>
													</div>
													<div class="Stats">
														<div class="Level">레벨17</div>
														<div class="CS">
															<span class="CS tip"
																title="미니언 240  + 몬스터 54<br>분당CS 11.2개">294
																(11.2)</span> CS
														</div>
														<div class="CKRate tip" title="킬관여율">킬관여 63%</div>
														<div class="MMR">
															<span>매치 평균</span> <br> <b>Master</b>
														</div>
													</div>
													<div class="Items">
														<div class="ItemList">
															<div class="Item">
																<img
																	src="//opgg-static.akamaized.net/images/lol/item/3153.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #00cfbc'>몰락한 왕의 검</b><br><span>상대의 체력에 비례하여 피해를 입히고, 상대의 이동 속도를 훔칠 수 있습니다.</span><br><span><stats>공격력 +40<br>공격 속도 +25%<br>생명력 흡수 +12%</stats><br><br><unique>고유 지속 효과:</unique> 기본 공격 적중 시 대상 현재 체력의 8%에 해당하는 추가 물리 피해를 입힙니다. (근접 챔피언은 12%)<br><active>고유 사용 효과:</active> 적 챔피언에게 100의 마법 피해를 입히고, 3초 동안 대상 이동 속도의 25%를 훔칩니다. (재사용 대기시간 90초)<br><br><rules>최소 15의 추가 물리 피해를 입힙니다.<br>몬스터 및 미니언에게 최대 60의 추가 물리 피해를 입힙니다.<br>사용자의 생명력 흡수가 입힌 추가 물리 피해에 적용됩니다.</rules></span><br><span>가격:</span> <span style='color: #ffc659'>3300 (700)</span>"
																	alt="몰락한 왕의 검">
															</div>
															<div class="Item">
																<img
																	src="//opgg-static.akamaized.net/images/lol/item/3031.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #00cfbc'>무한의 대검</b><br><span>치명타 확률이 대폭 증가합니다.</span><br><span><stats>공격력 +80<br>치명타 확률 +25%</stats><br><br><unique>고유 지속 효과:</unique> 치명타가 피해량의 200%가 아닌 225%를 가합니다.</span><br><span>가격:</span> <span style='color: #ffc659'>3400 (425)</span>"
																	alt="무한의 대검">
															</div>
															<div class="Item">
																<img
																	src="//opgg-static.akamaized.net/images/lol/item/3006.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #00cfbc'>광전사의 군화</b><br><span>이동 속도와 공격 속도가 상승합니다.</span><br><span><groupLimit>1개만 구입 가능합니다.</groupLimit><br><br><stats> 공격 속도 +35%</stats><br><br><unique>고유 지속 효과 - 이동 속도 향상:</unique> 이동 속도 +45</span><br><span>가격:</span> <span style='color: #ffc659'>1100 (500)</span>"
																	alt="광전사의 군화">
															</div>
															<div class="Item">
																<img
																	src="//opgg-static.akamaized.net/images/lol/item/3363.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #00cfbc'>망원형 개조</b><br><span>설치 범위가 증가하며 대상 지역을 드러내 줍니다.</span><br><span><levelLimit>업그레이드하려면 9레벨 이상이 되어야 합니다.</levelLimit><br><groupLimit>장신구 소지 개수는 1개로 제한됩니다.</groupLimit><br><br><font color='#FFFFFF'>와드 토템</font> 장신구 업그레이드 시:<br><br><stats><font color='#00FF00'>+</font> 설치 가능 범위 대폭(+650%) 증가<br><font color='#00FF00'>+</font> 지속시간 제한 없음, 와드 설치 개수 제한에 관계 없음<br><font color='#FF0000'>-</font> <font color='#FF6600'>재사용 대기시간 10% 증가</font><br><font color='#FF0000'>-</font> <font color='#FF6600'>누구나 볼 수 있는 와드로, 파괴 가능하고 아군의 대상으로 지정 불가</font><br><font color='#FF0000'>-</font> <font color='#FF6600'>와드 시야 범위 45% 감소</font><br><font color='#FF0000'>-</font> <font color='#FF6600'>상점 방문 시 충전되지 않음</font></stats></span>"
																	alt="망원형 개조">
															</div>
															<div class="Item">
																<img
																	src="//opgg-static.akamaized.net/images/lol/item/3508.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #00cfbc'>정수 약탈자</b><br><span>치명타 확률과 공격력이 증가하고 재사용 대기시간이 감소하며 공격 적중 시 마나를 회복합니다.</span><br><span><stats>공격력 +70<br>치명타 확률 +25%</stats><br><br><unique>고유 지속 효과:</unique> 재사용 대기시간 감소 +20%<br><unique>고유 지속 효과:</unique> 기본 공격 시 잃은 마나의 1.5%를 회복합니다.</span><br><span>가격:</span> <span style='color: #ffc659'>3300 (100)</span>"
																	alt="정수 약탈자">
															</div>
															<div class="Item">
																<img
																	src="//opgg-static.akamaized.net/images/lol/item/3094.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #00cfbc'>고속 연사포</b><br><span>이동하며 완전히 충전하면 강력한 일격을 발사합니다.</span><br><span><stats>공격 속도 +30%<br>치명타 확률 +25%<br>이동 속도 +7%</stats><br><br><unique>고유 지속 효과 - 충전 상태:</unique> 이동하거나 공격하면 <a href=&quot;#&quot;>충전 상태</a>가 됩니다. <br><unique>고유 지속 효과 - 저격수:</unique> 충전 상태로 공격 시 <magicDamage>120의 추가 마법 피해</magicDamage>를 입히며 사거리가 35% 증가합니다. (최대 사거리 +150)</span><br><span>가격:</span> <span style='color: #ffc659'>2600 (500)</span>"
																	alt="고속 연사포">
															</div>
															<div class="Item">
																<div class="Image NoItem"></div>
															</div>
															<button class="Button OpenBuildButton tip" title="빌드"
																type="button">
																<img class="On"
																	src="//opgg-static.akamaized.net/css3/sprite/images/icon-buildblue-p.png">
																<img class="Off"
																	src="//opgg-static.akamaized.net/css3/sprite/images/icon-buildblue-p.png">
															</button>
														</div>
														<div class="Trinket">
															<img
																src="//opgg-static.akamaized.net/images/site/summoner/icon-ward-blue.png">
															제어 와드 <span class="wards vision">6</span>
														</div>
													</div>
													<div class="FollowPlayers Names">
														<div class="Team">
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-45 tip"
																		title="제이스">제이스</div>
																	<div class="Image20 __sprite __spc20 __spc20-45 tip"
																		title="제이스">제이스</div>
																</div>
																<div class="SummonerName">
																	<a
																		href="//www.op.gg/summoner/userName=Lv+1+%EC%88%98%EA%B5%AC%EB%A6%AC"
																		class="Link" target="_blank">Lv 1 수구리</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-64 tip"
																		title="릴리아">릴리아</div>
																	<div class="Image20 __sprite __spc20 __spc20-64 tip"
																		title="릴리아">릴리아</div>
																</div>
																<div class="SummonerName">
																	<a
																		href="//www.op.gg/summoner/userName=DWG+%EC%96%B4%EB%8B%88%EC%96%B8"
																		class="Link" target="_blank">DWG 어니언</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-117 tip"
																		title="탈론">탈론</div>
																	<div class="Image20 __sprite __spc20 __spc20-117 tip"
																		title="탈론">탈론</div>
																</div>
																<div class="SummonerName">
																	<a
																		href="//www.op.gg/summoner/userName=%EC%82%AC%EC%8A%A4%EA%B0%93%EC%A7%80%EC%A7%80"
																		class="Link" target="_blank">사스갓지지</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-46 tip"
																		title="진">진</div>
																	<div class="Image20 __sprite __spc20 __spc20-46 tip"
																		title="진">진</div>
																</div>
																<div class="SummonerName">
																	<a href="//www.op.gg/summoner/userName=vvi2"
																		class="Link" target="_blank">vvi2</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-120 tip"
																		title="쓰레쉬">쓰레쉬</div>
																	<div class="Image20 __sprite __spc20 __spc20-120 tip"
																		title="쓰레쉬">쓰레쉬</div>
																</div>
																<div class="SummonerName">
																	<a href="//www.op.gg/summoner/userName=Inner+Child+4"
																		class="Link" target="_blank">Inner Child 4</a>
																</div>
															</div>
														</div>
														<div class="Team">
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-95 tip"
																		title="레넥톤">레넥톤</div>
																	<div class="Image20 __sprite __spc20 __spc20-95 tip"
																		title="레넥톤">레넥톤</div>
																</div>
																<div class="SummonerName">
																	<a
																		href="//www.op.gg/summoner/userName=%EA%B0%84%EB%8B%A4%EB%9D%BC%EC%BF%A4%EB%8B%A4"
																		class="Link" target="_blank">간다라쿤다</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-25 tip"
																		title="엘리스">엘리스</div>
																	<div class="Image20 __sprite __spc20 __spc20-25 tip"
																		title="엘리스">엘리스</div>
																</div>
																<div class="SummonerName">
																	<a
																		href="//www.op.gg/summoner/userName=%EB%A7%88%EC%9D%B4%ED%8B%B0%EB%B2%A0%EC%96%B4"
																		class="Link" target="_blank">마이티베어</a>
																</div>
															</div>
															<div class="Summoner Requester">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-66 tip"
																		title="루시안">루시안</div>
																	<div class="Image20 __sprite __spc20 __spc20-66 tip"
																		title="루시안">루시안</div>
																</div>
																<div class="SummonerName">
																	<a href="//www.op.gg/summoner/userName=Hide+on+bush"
																		class="Link" target="_blank">Hide on bush</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-15 tip"
																		title="케이틀린">케이틀린</div>
																	<div class="Image20 __sprite __spc20 __spc20-15 tip"
																		title="케이틀린">케이틀린</div>
																</div>
																<div class="SummonerName">
																	<a href="//www.op.gg/summoner/userName=jkjkjkjkk"
																		class="Link" target="_blank">jkjkjkjkk</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-87 tip"
																		title="판테온">판테온</div>
																	<div class="Image20 __sprite __spc20 __spc20-87 tip"
																		title="판테온">판테온</div>
																</div>
																<div class="SummonerName">
																	<a href="//www.op.gg/summoner/userName=EM+Karas"
																		class="Link" target="_blank">EM Karas</a>
																</div>
															</div>
														</div>
													</div>
													<div class="StatsButton">
														<div class="Content">
															<div class="Item">
																<a id="right_match_replay" href="#"
																	class="Button Replay OpenSpectateButton"> <span
																	class="__spSite __spSite-159"></span></a>
															</div>
															<div class="Item">
																<a id="right_match" href="#" class="Button MatchDetail">
																	<span class="__spSite __spSite-194 Off"></span> <span
																	class="__spSite __spSite-193 On"></span>
																</a>
															</div>
														</div>
													</div>
												</div>
												<div class="GameDetail"></div>
											</div>
										</div>
										<div class="GameItemWrap">
											<div class="GameItem Lose  " data-summoner-id="4460427"
												data-game-time="1599323380" data-game-id="4626199865"
												data-game-result="lose">
												<div class="Content">
													<div class="GameStats">
														<div class="GameType" title="솔랭">솔랭</div>
														<div class="TimeStamp">
															<span class="_timeago _timeCountAssigned tip"
																data-datetime="1599323380" data-type=""
																data-interval="60" title="2020년 9월 6일 오전 1시 52분">2일
																전</span>
														</div>
														<div class="Bar"></div>
														<div class="GameResult">패배</div>
														<div class="GameLength">43분 2초</div>

													</div>
													<div class="GameSettingInfo">
														<div class="ChampionImage">
															<a href="/champion/renekton/statistics" target="_blank"><img
																src="//opgg-static.akamaized.net/images/lol/champion/Renekton.png?image=q_auto,w_46&amp;v=1596679559"
																class="Image" alt="레넥톤"></a>
														</div>

														<div class="SummonerSpell">
															<div class="Spell">
																<img
																	src="//opgg-static.akamaized.net/images/lol/spell/SummonerTeleport.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #ffc659'>순간이동</b><br><span>4초 동안 정신을 집중한 다음, 챔피언이 지정한 아군 구조물, 미니언, 혹은 와드로 순간이동하고 이동 속도가 증가합니다. 순간이동의 재사용 대기시간은 챔피언 레벨에 따라 420~240초입니다.</span>"
																	alt="순간이동">
															</div>
															<div class="Spell">
																<img
																	src="//opgg-static.akamaized.net/images/lol/spell/SummonerFlash.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #ffc659'>점멸</b><br><span>커서 방향으로 챔피언이 짧은 거리를 순간이동합니다.</span>"
																	alt="점멸">
															</div>
														</div>
														<div class="Runes">
															<div class="Rune">
																<img
																	src="//opgg-static.akamaized.net/images/lol/perk/8005.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #ffc659'>집중 공격</b><br><span>적 챔피언에게 연속으로 3회 기본 공격을 가하면 레벨에 따라 40 ~ 180의 추가 <lol-uikit-tooltipped-keyword key='LinkTooltip_Description_AdaptiveDmg'><font color='#48C4B7'>적응형 피해</font></lol-uikit-tooltipped-keyword>를 입히고 적의 약점을 노출시킵니다. 약점이 노출된 적은 6초 동안 모든 상대에게서 8 ~ 12%의 추가 피해를 받습니다.</span>"
																	alt="집중 공격">
															</div>
															<div class="Rune">
																<img
																	src="//opgg-static.akamaized.net/images/lol/perkStyle/8300.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #ffc659'>영감</b><br><span>다양한 방식의 전투 보조</span>"
																	alt="영감">
															</div>
														</div>
														<div class="ChampionName">
															<a href="/champion/renekton/statistics" target="_blank">레넥톤</a>
														</div>
													</div>
													<div class="KDA">
														<div class="KDA">
															<span class="Kill">7</span> / <span class="Death">6</span>
															/ <span class="Assist">11</span>
														</div>
														<div class="KDARatio">
															<span class="KDARatio ">3.00:1</span> 평점
														</div>
														<div class="Badge">
															<span class="Text ACE">ACE</span>
														</div>
													</div>
													<div class="Stats">
														<div class="Level">레벨18</div>
														<div class="CS">
															<span class="CS tip"
																title="미니언 345  + 몬스터 27<br>분당CS 8.6개">372 (8.6)</span>
															CS
														</div>
														<div class="CKRate tip" title="킬관여율">킬관여 51%</div>
														<div class="MMR">
															<span>매치 평균</span> <br> <b>Master</b>
														</div>
													</div>
													<div class="Items">
														<div class="ItemList">
															<div class="Item">
																<img
																	src="//opgg-static.akamaized.net/images/lol/item/3153.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #00cfbc'>몰락한 왕의 검</b><br><span>상대의 체력에 비례하여 피해를 입히고, 상대의 이동 속도를 훔칠 수 있습니다.</span><br><span><stats>공격력 +40<br>공격 속도 +25%<br>생명력 흡수 +12%</stats><br><br><unique>고유 지속 효과:</unique> 기본 공격 적중 시 대상 현재 체력의 8%에 해당하는 추가 물리 피해를 입힙니다. (근접 챔피언은 12%)<br><active>고유 사용 효과:</active> 적 챔피언에게 100의 마법 피해를 입히고, 3초 동안 대상 이동 속도의 25%를 훔칩니다. (재사용 대기시간 90초)<br><br><rules>최소 15의 추가 물리 피해를 입힙니다.<br>몬스터 및 미니언에게 최대 60의 추가 물리 피해를 입힙니다.<br>사용자의 생명력 흡수가 입힌 추가 물리 피해에 적용됩니다.</rules></span><br><span>가격:</span> <span style='color: #ffc659'>3300 (700)</span>"
																	alt="몰락한 왕의 검">
															</div>
															<div class="Item">
																<img
																	src="//opgg-static.akamaized.net/images/lol/item/3143.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #00cfbc'>란두인의 예언</b><br><span>방어력이 대폭 강화됩니다. 사용하면 주변 적들이 둔화에 걸립니다.</span><br><span><stats>체력 +400<br>방어력 +70</stats><br><br><unique>고유 지속 효과:</unique>기본 공격 치명타로 입는 피해량 -20%<br><unique>고유 지속 효과 - 차가운 강철:</unique>기본 공격에 맞으면 1초 동안 공격한 챔피언의 공격 속도가 15% 감소합니다.<br><active>고유 사용 효과:</active> 주변 적 유닛의 이동 속도를 2초 동안 55%만큼 둔화시킵니다. (재사용 대기시간 60초)</span><br><span>가격:</span> <span style='color: #ffc659'>2900 (900)</span>"
																	alt="란두인의 예언">
															</div>
															<div class="Item">
																<img
																	src="//opgg-static.akamaized.net/images/lol/item/3026.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #00cfbc'>수호 천사</b><br><span>주기적으로 챔피언 사망 시 부활시켜 줍니다.</span><br><span><stats>공격력 +45<br>방어력 +40</stats><br><br><unique>고유 지속 효과:</unique> 치명적인 피해를 입으면 4초 동안 경직에 걸린 다음 기본 체력의 50%, 최대 마나의 30%를 회복합니다. (재사용 대기시간 300초)</span><br><span>가격:</span> <span style='color: #ffc659'>2800 (50)</span>"
																	alt="수호 천사">
															</div>
															<div class="Item">
																<img
																	src="//opgg-static.akamaized.net/images/lol/item/3363.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #00cfbc'>망원형 개조</b><br><span>설치 범위가 증가하며 대상 지역을 드러내 줍니다.</span><br><span><levelLimit>업그레이드하려면 9레벨 이상이 되어야 합니다.</levelLimit><br><groupLimit>장신구 소지 개수는 1개로 제한됩니다.</groupLimit><br><br><font color='#FFFFFF'>와드 토템</font> 장신구 업그레이드 시:<br><br><stats><font color='#00FF00'>+</font> 설치 가능 범위 대폭(+650%) 증가<br><font color='#00FF00'>+</font> 지속시간 제한 없음, 와드 설치 개수 제한에 관계 없음<br><font color='#FF0000'>-</font> <font color='#FF6600'>재사용 대기시간 10% 증가</font><br><font color='#FF0000'>-</font> <font color='#FF6600'>누구나 볼 수 있는 와드로, 파괴 가능하고 아군의 대상으로 지정 불가</font><br><font color='#FF0000'>-</font> <font color='#FF6600'>와드 시야 범위 45% 감소</font><br><font color='#FF0000'>-</font> <font color='#FF6600'>상점 방문 시 충전되지 않음</font></stats></span>"
																	alt="망원형 개조">
															</div>
															<div class="Item">
																<img
																	src="//opgg-static.akamaized.net/images/lol/item/3812.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #00cfbc'>죽음의 무도</b><br><span>입은 피해 적용이 잠시 미뤄집니다.</span><br><span><stats>공격력 +50<br>방어력 +30<br>마법 저항력 +30<br>재사용 대기시간 감소 +10%</stats><br><br><unique>고유 지속 효과:</unique> 적에게 가한 피해량의 15%만큼 체력을 회복합니다. 이 효과는 광역 피해에는 33%만 적용됩니다.<br><unique>고유 지속 효과:</unique> 입은 피해의 <specialRules>30%(근접 챔피언)/10%(원거리 챔피언)</specialRules>가 3초 동안 지속되는 출혈 효과로 전환됩니다.</span><br><span>가격:</span> <span style='color: #ffc659'>3600 (500)</span>"
																	alt="죽음의 무도">
															</div>
															<div class="Item">
																<img
																	src="//opgg-static.akamaized.net/images/lol/item/3071.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #00cfbc'>칠흑의 양날 도끼</b><br><span>적 챔피언에게 물리 피해를 입히면 적의 방어력이 감소합니다.</span><br><span><stats>체력 +400<br>공격력 +40<br>재사용 대기시간 감소 +20%</stats><br><br><unique>고유 지속 효과:</unique> 적 챔피언에게 물리 피해를 입히면 대상을 베어, 6초 동안 방어력을 4% 감소시킵니다. (최대 6번, 24%까지 중첩)<br><unique>고유 지속 효과 - 격분:</unique> 물리 피해를 입히면 2초 동안 이동 속도가 20 상승합니다. 베어낸 적 챔피언의 처치를 돕거나 어떤 유닛이든 처치하면 대신 2초 동안 이동 속도가 60 상승합니다. 원거리 챔피언은 이 이동 속도의 절반만 상승합니다.</span><br><span>가격:</span> <span style='color: #ffc659'>3000 (950)</span>"
																	alt="칠흑의 양날 도끼">
															</div>
															<div class="Item">
																<img
																	src="//opgg-static.akamaized.net/images/lol/item/3111.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #00cfbc'>헤르메스의 발걸음</b><br><span>이동 속도가 증가하고, 방해 효과의 지속시간이 줄어듭니다.</span><br><span><groupLimit>1개만 구입 가능합니다.</groupLimit><br><br><stats>마법 저항력 +25</stats><br><br><unique>고유 지속 효과 - 이동 속도 향상:</unique> 이동 속도 +45<br><unique>고유 지속 효과 - 강인함:</unique> 기절, 둔화, 도발, 공포, 침묵, 실명, 변이 및 이동 불가 효과의 지속시간이 30% 감소합니다.</span><br><span>가격:</span> <span style='color: #ffc659'>1100 (350)</span>"
																	alt="헤르메스의 발걸음">
															</div>
															<button class="Button OpenBuildButton tip" title="빌드"
																type="button">
																<img class="On"
																	src="//opgg-static.akamaized.net/css3/sprite/images/icon-buildred-p.png">
																<img class="Off"
																	src="//opgg-static.akamaized.net/css3/sprite/images/icon-buildred-p.png">
															</button>
														</div>
														<div class="Trinket">
															<img
																src="//opgg-static.akamaized.net/images/site/summoner/icon-ward-red.png">
															제어 와드 <span class="wards vision">9</span>
														</div>
													</div>
													<div class="FollowPlayers Names">
														<div class="Team">
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-2 tip"
																		title="아칼리">아칼리</div>
																	<div class="Image20 __sprite __spc20 __spc20-2 tip"
																		title="아칼리">아칼리</div>
																</div>
																<div class="SummonerName">
																	<a
																		href="//www.op.gg/summoner/userName=%EA%B0%84%EB%8B%A4%EB%9D%BC%EC%BF%A4%EB%8B%A4"
																		class="Link" target="_blank">간다라쿤다</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-64 tip"
																		title="릴리아">릴리아</div>
																	<div class="Image20 __sprite __spc20 __spc20-64 tip"
																		title="릴리아">릴리아</div>
																</div>
																<div class="SummonerName">
																	<a
																		href="//www.op.gg/summoner/userName=%EB%A7%88%EC%9D%B4%ED%8B%B0%EB%B2%A0%EC%96%B4"
																		class="Link" target="_blank">마이티베어</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-90 tip"
																		title="키아나">키아나</div>
																	<div class="Image20 __sprite __spc20 __spc20-90 tip"
																		title="키아나">키아나</div>
																</div>
																<div class="SummonerName">
																	<a
																		href="//www.op.gg/summoner/userName=%EB%AA%BB%ED%95%A0+%EB%95%8C%EB%8F%84+%EC%9E%88%EC%A7%80"
																		class="Link" target="_blank">못할 때도 있지</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-15 tip"
																		title="케이틀린">케이틀린</div>
																	<div class="Image20 __sprite __spc20 __spc20-15 tip"
																		title="케이틀린">케이틀린</div>
																</div>
																<div class="SummonerName">
																	<a href="//www.op.gg/summoner/userName=jkjkjkjkk"
																		class="Link" target="_blank">jkjkjkjkk</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-71 tip"
																		title="마오카이">마오카이</div>
																	<div class="Image20 __sprite __spc20 __spc20-71 tip"
																		title="마오카이">마오카이</div>
																</div>
																<div class="SummonerName">
																	<a
																		href="//www.op.gg/summoner/userName=%EB%91%A0+%EC%8B%AC"
																		class="Link" target="_blank">둠 심</a>
																</div>
															</div>
														</div>
														<div class="Team">
															<div class="Summoner Requester">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-95 tip"
																		title="레넥톤">레넥톤</div>
																	<div class="Image20 __sprite __spc20 __spc20-95 tip"
																		title="레넥톤">레넥톤</div>
																</div>
																<div class="SummonerName">
																	<a href="//www.op.gg/summoner/userName=Hide+on+bush"
																		class="Link" target="_blank">Hide on bush</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-25 tip"
																		title="엘리스">엘리스</div>
																	<div class="Image20 __sprite __spc20 __spc20-25 tip"
																		title="엘리스">엘리스</div>
																</div>
																<div class="SummonerName">
																	<a href="//www.op.gg/summoner/userName=vvi2"
																		class="Link" target="_blank">vvi2</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-117 tip"
																		title="탈론">탈론</div>
																	<div class="Image20 __sprite __spc20 __spc20-117 tip"
																		title="탈론">탈론</div>
																</div>
																<div class="SummonerName">
																	<a
																		href="//www.op.gg/summoner/userName=%EC%82%AC%EC%8A%A4%EA%B0%93%EC%A7%80%EC%A7%80"
																		class="Link" target="_blank">사스갓지지</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-101 tip"
																		title="세나">세나</div>
																	<div class="Image20 __sprite __spc20 __spc20-101 tip"
																		title="세나">세나</div>
																</div>
																<div class="SummonerName">
																	<a href="//www.op.gg/summoner/userName=EM+Karas"
																		class="Link" target="_blank">EM Karas</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-102 tip"
																		title="세트">세트</div>
																	<div class="Image20 __sprite __spc20 __spc20-102 tip"
																		title="세트">세트</div>
																</div>
																<div class="SummonerName">
																	<a href="//www.op.gg/summoner/userName=Mniu+supGod"
																		class="Link" target="_blank">Mniu supGod</a>
																</div>
															</div>
														</div>
													</div>
													<div class="StatsButton">
														<div class="Content">
															<div class="Item">
																<a id="right_match_replay" href="#"
																	class="Button Replay OpenSpectateButton"> <span
																	class="__spSite __spSite-159"></span></a>
															</div>
															<div class="Item">
																<a id="right_match" href="#" class="Button MatchDetail">
																	<span class="__spSite __spSite-198 Off"></span> <span
																	class="__spSite __spSite-197 On"></span>
																</a>
															</div>
														</div>
													</div>
												</div>
												<div class="GameDetail"></div>
											</div>
										</div>
										<div class="GameItemWrap">
											<div class="GameItem Lose  " data-summoner-id="4460427"
												data-game-time="1599320320" data-game-id="4626221231"
												data-game-result="lose">
												<div class="Content">
													<div class="GameStats">
														<div class="GameType" title="솔랭">솔랭</div>
														<div class="TimeStamp">
															<span class="_timeago _timeCountAssigned tip"
																data-datetime="1599320320" data-type=""
																data-interval="60" title="2020년 9월 6일 오전 1시 01분">2일
																전</span>
														</div>
														<div class="Bar"></div>
														<div class="GameResult">패배</div>
														<div class="GameLength">29분 9초</div>

													</div>
													<div class="GameSettingInfo">
														<div class="ChampionImage">
															<a href="/champion/lucian/statistics" target="_blank"><img
																src="//opgg-static.akamaized.net/images/lol/champion/Lucian.png?image=q_auto,w_46&amp;v=1596679559"
																class="Image" alt="루시안"></a>
														</div>

														<div class="SummonerSpell">
															<div class="Spell">
																<img
																	src="//opgg-static.akamaized.net/images/lol/spell/SummonerBoost.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #ffc659'>정화</b><br><span>챔피언에 걸린 모든 이동 불가와 (제압 및 공중으로 띄우는 효과 제외) 소환사 주문에 의한 해로운 효과를 제거하고 새로 적용되는 이동 불가 효과들의 지속시간을 3초간 65% 감소시킵니다.</span>"
																	alt="정화">
															</div>
															<div class="Spell">
																<img
																	src="//opgg-static.akamaized.net/images/lol/spell/SummonerFlash.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #ffc659'>점멸</b><br><span>커서 방향으로 챔피언이 짧은 거리를 순간이동합니다.</span>"
																	alt="점멸">
															</div>
														</div>
														<div class="Runes">
															<div class="Rune">
																<img
																	src="//opgg-static.akamaized.net/images/lol/perk/8005.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #ffc659'>집중 공격</b><br><span>적 챔피언에게 연속으로 3회 기본 공격을 가하면 레벨에 따라 40 ~ 180의 추가 <lol-uikit-tooltipped-keyword key='LinkTooltip_Description_AdaptiveDmg'><font color='#48C4B7'>적응형 피해</font></lol-uikit-tooltipped-keyword>를 입히고 적의 약점을 노출시킵니다. 약점이 노출된 적은 6초 동안 모든 상대에게서 8 ~ 12%의 추가 피해를 받습니다.</span>"
																	alt="집중 공격">
															</div>
															<div class="Rune">
																<img
																	src="//opgg-static.akamaized.net/images/lol/perkStyle/8200.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #ffc659'>마법</b><br><span>스킬 및 광역 효과 강화</span>"
																	alt="마법">
															</div>
														</div>
														<div class="ChampionName">
															<a href="/champion/lucian/statistics" target="_blank">루시안</a>
														</div>
													</div>
													<div class="KDA">
														<div class="KDA">
															<span class="Kill">3</span> / <span class="Death">2</span>
															/ <span class="Assist">6</span>
														</div>
														<div class="KDARatio">
															<span class="KDARatio ">4.50:1</span> 평점
														</div>
														<div class="Badge">
															<span class="Text ACE">ACE</span>
														</div>
													</div>
													<div class="Stats">
														<div class="Level">레벨16</div>
														<div class="CS">
															<span class="CS tip"
																title="미니언 258  + 몬스터 42<br>분당CS 10.3개">300
																(10.3)</span> CS
														</div>
														<div class="CKRate tip" title="킬관여율">킬관여 45%</div>
														<div class="MMR">
															<span>매치 평균</span> <br> <b>Grandmaster</b>
														</div>
													</div>
													<div class="Items">
														<div class="ItemList">
															<div class="Item">
																<img
																	src="//opgg-static.akamaized.net/images/lol/item/2033.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #00cfbc'>부패 물약</b><br><span>체력과 마나가 일정 시간 동안 회복되고 전투 능력을 상승시킵니다. 상점에 가면 다시 충전됩니다.</span><br><span><groupLimit>한 번에 한 종류의 회복 물약만 소지할 수 있습니다.</groupLimit><br><br><active>고유 사용 효과:</active> 충전량을 1회 소모해 12초 동안 125의 체력과 75의 마나를 회복하고, 그 동안 <font color='#FF8811'><u>부패의 손길</u></font>을 활성화합니다. 상점 방문 시 3회의 충전량이 다시 채워집니다.<br><br><font color='#FF8811'><u>부패의 손길:</u></font> 적 챔피언에게 주문 및 공격으로 피해를 입히면 적을 불태워 3초 동안 15의 마법 피해를 입힙니다. (광역 및 지속 피해 스킬 사용 시에는 피해의 50%만 적용됩니다. 피해량은 챔피언 레벨에 비례해 증가합니다.)<br><br><rules>(부패 물약은 체력과 마나가 모두 차 있을 때도 사용할 수 있습니다.)</rules></span><br><span>가격:</span> <span style='color: #ffc659'>500 (350)</span>"
																	alt="부패 물약">
															</div>
															<div class="Item">
																<img
																	src="//opgg-static.akamaized.net/images/lol/item/3140.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #00cfbc'>수은 장식띠</b><br><span>사용하면 모든 군중 제어 효과가 제거됩니다.</span><br><span><stats>마법 저항력 +30</stats><br><br><active>고유 사용 효과 - 수은:</active> 챔피언에게 걸린 모든 군중 제어 효과를 제거합니다. (재사용 대기시간 90초)</span><br><span>가격:</span> <span style='color: #ffc659'>1300 (850)</span>"
																	alt="수은 장식띠">
															</div>
															<div class="Item">
																<img
																	src="//opgg-static.akamaized.net/images/lol/item/3006.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #00cfbc'>광전사의 군화</b><br><span>이동 속도와 공격 속도가 상승합니다.</span><br><span><groupLimit>1개만 구입 가능합니다.</groupLimit><br><br><stats> 공격 속도 +35%</stats><br><br><unique>고유 지속 효과 - 이동 속도 향상:</unique> 이동 속도 +45</span><br><span>가격:</span> <span style='color: #ffc659'>1100 (500)</span>"
																	alt="광전사의 군화">
															</div>
															<div class="Item">
																<img
																	src="//opgg-static.akamaized.net/images/lol/item/3363.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #00cfbc'>망원형 개조</b><br><span>설치 범위가 증가하며 대상 지역을 드러내 줍니다.</span><br><span><levelLimit>업그레이드하려면 9레벨 이상이 되어야 합니다.</levelLimit><br><groupLimit>장신구 소지 개수는 1개로 제한됩니다.</groupLimit><br><br><font color='#FFFFFF'>와드 토템</font> 장신구 업그레이드 시:<br><br><stats><font color='#00FF00'>+</font> 설치 가능 범위 대폭(+650%) 증가<br><font color='#00FF00'>+</font> 지속시간 제한 없음, 와드 설치 개수 제한에 관계 없음<br><font color='#FF0000'>-</font> <font color='#FF6600'>재사용 대기시간 10% 증가</font><br><font color='#FF0000'>-</font> <font color='#FF6600'>누구나 볼 수 있는 와드로, 파괴 가능하고 아군의 대상으로 지정 불가</font><br><font color='#FF0000'>-</font> <font color='#FF6600'>와드 시야 범위 45% 감소</font><br><font color='#FF0000'>-</font> <font color='#FF6600'>상점 방문 시 충전되지 않음</font></stats></span>"
																	alt="망원형 개조">
															</div>
															<div class="Item">
																<img
																	src="//opgg-static.akamaized.net/images/lol/item/3508.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #00cfbc'>정수 약탈자</b><br><span>치명타 확률과 공격력이 증가하고 재사용 대기시간이 감소하며 공격 적중 시 마나를 회복합니다.</span><br><span><stats>공격력 +70<br>치명타 확률 +25%</stats><br><br><unique>고유 지속 효과:</unique> 재사용 대기시간 감소 +20%<br><unique>고유 지속 효과:</unique> 기본 공격 시 잃은 마나의 1.5%를 회복합니다.</span><br><span>가격:</span> <span style='color: #ffc659'>3300 (100)</span>"
																	alt="정수 약탈자">
															</div>
															<div class="Item">
																<img
																	src="//opgg-static.akamaized.net/images/lol/item/3031.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #00cfbc'>무한의 대검</b><br><span>치명타 확률이 대폭 증가합니다.</span><br><span><stats>공격력 +80<br>치명타 확률 +25%</stats><br><br><unique>고유 지속 효과:</unique> 치명타가 피해량의 200%가 아닌 225%를 가합니다.</span><br><span>가격:</span> <span style='color: #ffc659'>3400 (425)</span>"
																	alt="무한의 대검">
															</div>
															<div class="Item">
																<img
																	src="//opgg-static.akamaized.net/images/lol/item/3094.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #00cfbc'>고속 연사포</b><br><span>이동하며 완전히 충전하면 강력한 일격을 발사합니다.</span><br><span><stats>공격 속도 +30%<br>치명타 확률 +25%<br>이동 속도 +7%</stats><br><br><unique>고유 지속 효과 - 충전 상태:</unique> 이동하거나 공격하면 <a href=&quot;#&quot;>충전 상태</a>가 됩니다. <br><unique>고유 지속 효과 - 저격수:</unique> 충전 상태로 공격 시 <magicDamage>120의 추가 마법 피해</magicDamage>를 입히며 사거리가 35% 증가합니다. (최대 사거리 +150)</span><br><span>가격:</span> <span style='color: #ffc659'>2600 (500)</span>"
																	alt="고속 연사포">
															</div>
															<button class="Button OpenBuildButton tip" title="빌드"
																type="button">
																<img class="On"
																	src="//opgg-static.akamaized.net/css3/sprite/images/icon-buildred-p.png">
																<img class="Off"
																	src="//opgg-static.akamaized.net/css3/sprite/images/icon-buildred-p.png">
															</button>
														</div>
														<div class="Trinket">
															<img
																src="//opgg-static.akamaized.net/images/site/summoner/icon-ward-red.png">
															제어 와드 <span class="wards vision">8</span>
														</div>
													</div>
													<div class="FollowPlayers Names">
														<div class="Team">
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-117 tip"
																		title="탈론">탈론</div>
																	<div class="Image20 __sprite __spc20 __spc20-117 tip"
																		title="탈론">탈론</div>
																</div>
																<div class="SummonerName">
																	<a
																		href="//www.op.gg/summoner/userName=FPXzhaoAP4506303"
																		class="Link" target="_blank">FPXzhaoAP4506303</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-26 tip"
																		title="이블린">이블린</div>
																	<div class="Image20 __sprite __spc20 __spc20-26 tip"
																		title="이블린">이블린</div>
																</div>
																<div class="SummonerName">
																	<a href="//www.op.gg/summoner/userName=YMzhao906731647"
																		class="Link" target="_blank">YMzhao906731647</a>
																</div>
															</div>
															<div class="Summoner Requester">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-66 tip"
																		title="루시안">루시안</div>
																	<div class="Image20 __sprite __spc20 __spc20-66 tip"
																		title="루시안">루시안</div>
																</div>
																<div class="SummonerName">
																	<a href="//www.op.gg/summoner/userName=Hide+on+bush"
																		class="Link" target="_blank">Hide on bush</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-7 tip"
																		title="아펠리오스">아펠리오스</div>
																	<div class="Image20 __sprite __spc20 __spc20-7 tip"
																		title="아펠리오스">아펠리오스</div>
																</div>
																<div class="SummonerName">
																	<a
																		href="//www.op.gg/summoner/userName=%EB%B0%A4%EC%9D%B4%EC%8B%AB%EC%96%B4"
																		class="Link" target="_blank">밤이싫어</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-120 tip"
																		title="쓰레쉬">쓰레쉬</div>
																	<div class="Image20 __sprite __spc20 __spc20-120 tip"
																		title="쓰레쉬">쓰레쉬</div>
																</div>
																<div class="SummonerName">
																	<a href="//www.op.gg/summoner/userName=EM+Karas"
																		class="Link" target="_blank">EM Karas</a>
																</div>
															</div>
														</div>
														<div class="Team">
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-17 tip"
																		title="카시오페아">카시오페아</div>
																	<div class="Image20 __sprite __spc20 __spc20-17 tip"
																		title="카시오페아">카시오페아</div>
																</div>
																<div class="SummonerName">
																	<a
																		href="//www.op.gg/summoner/userName=%EC%A7%80%EA%B8%8B%EC%A7%80%EA%B8%8B%ED%95%9C%EB%8B%A4%EC%9D%B4%EC%95%84"
																		class="Link" target="_blank">지긋지긋한다이아</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-135 tip"
																		title="볼리베어">볼리베어</div>
																	<div class="Image20 __sprite __spc20 __spc20-135 tip"
																		title="볼리베어">볼리베어</div>
																</div>
																<div class="SummonerName">
																	<a href="//www.op.gg/summoner/userName=T1+Ellim"
																		class="Link" target="_blank">T1 Ellim</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-124 tip"
																		title="트위스티드 페이트">트위스티드 페이트</div>
																	<div class="Image20 __sprite __spc20 __spc20-124 tip"
																		title="트위스티드 페이트">트위스티드 페이트</div>
																</div>
																<div class="SummonerName">
																	<a href="//www.op.gg/summoner/userName=Pnpm"
																		class="Link" target="_blank">Pnpm</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-73 tip"
																		title="미스 포츈">미스 포츈</div>
																	<div class="Image20 __sprite __spc20 __spc20-73 tip"
																		title="미스 포츈">미스 포츈</div>
																</div>
																<div class="SummonerName">
																	<a href="//www.op.gg/summoner/userName=SANDBOX+To1anD"
																		class="Link" target="_blank">SANDBOX To1anD</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-63 tip"
																		title="레오나">레오나</div>
																	<div class="Image20 __sprite __spc20 __spc20-63 tip"
																		title="레오나">레오나</div>
																</div>
																<div class="SummonerName">
																	<a href="//www.op.gg/summoner/userName=Swordart777"
																		class="Link" target="_blank">Swordart777</a>
																</div>
															</div>
														</div>
													</div>
													<div class="StatsButton">
														<div class="Content">
															<div class="Item">
																<a id="right_match_replay" href="#"
																	class="Button Replay OpenSpectateButton"> <span
																	class="__spSite __spSite-159"></span></a>
															</div>
															<div class="Item">
																<a id="right_match" href="#" class="Button MatchDetail">
																	<span class="__spSite __spSite-198 Off"></span> <span
																	class="__spSite __spSite-197 On"></span>
																</a>
															</div>
														</div>
													</div>
												</div>
												<div class="GameDetail"></div>
											</div>
										</div>
										<div class="GameItemWrap">
											<div class="GameItem Win  " data-summoner-id="4460427"
												data-game-time="1599240517" data-game-id="4623870331"
												data-game-result="win">
												<div class="Content">
													<div class="GameStats">
														<div class="GameType" title="솔랭">솔랭</div>
														<div class="TimeStamp">
															<span class="_timeago _timeCountAssigned tip"
																data-datetime="1599240517" data-type=""
																data-interval="60" title="2020년 9월 5일 오전 2시 51분">3일
																전</span>
														</div>
														<div class="Bar"></div>
														<div class="GameResult">승리</div>
														<div class="GameLength">38분 43초</div>

													</div>
													<div class="GameSettingInfo">
														<div class="ChampionImage">
															<a href="/champion/cassiopeia/statistics" target="_blank"><img
																src="//opgg-static.akamaized.net/images/lol/champion/Cassiopeia.png?image=q_auto,w_46&amp;v=1596679559"
																class="Image" alt="카시오페아"></a>
														</div>

														<div class="SummonerSpell">
															<div class="Spell">
																<img
																	src="//opgg-static.akamaized.net/images/lol/spell/SummonerBoost.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #ffc659'>정화</b><br><span>챔피언에 걸린 모든 이동 불가와 (제압 및 공중으로 띄우는 효과 제외) 소환사 주문에 의한 해로운 효과를 제거하고 새로 적용되는 이동 불가 효과들의 지속시간을 3초간 65% 감소시킵니다.</span>"
																	alt="정화">
															</div>
															<div class="Spell">
																<img
																	src="//opgg-static.akamaized.net/images/lol/spell/SummonerFlash.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #ffc659'>점멸</b><br><span>커서 방향으로 챔피언이 짧은 거리를 순간이동합니다.</span>"
																	alt="점멸">
															</div>
														</div>
														<div class="Runes">
															<div class="Rune">
																<img
																	src="//opgg-static.akamaized.net/images/lol/perk/8230.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #ffc659'>난입</b><br><span>4초 안에 한 챔피언에게 기본 공격 3회 또는 <b>개별</b> 스킬 3회를 적중시키면 레벨에 따라 25~40%의 이동 속도와 75%의 둔화 저항 효과를 얻습니다. <br><br>근접 챔피언의 경우 이동 속도가 40~60% 증가합니다.<br><br>지속시간: 3초<br>재사용 대기시간: 15초</span>"
																	alt="난입">
															</div>
															<div class="Rune">
																<img
																	src="//opgg-static.akamaized.net/images/lol/perkStyle/8100.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #ffc659'>지배</b><br><span>강력한 피해와 빠른 접근</span>"
																	alt="지배">
															</div>
														</div>
														<div class="ChampionName">
															<a href="/champion/cassiopeia/statistics" target="_blank">카시오페아</a>
														</div>
													</div>
													<div class="KDA">
														<div class="KDA">
															<span class="Kill">12</span> / <span class="Death">2</span>
															/ <span class="Assist">13</span>
														</div>
														<div class="KDARatio">
															<span class="KDARatio ">12.50:1</span> 평점
														</div>
														<div class="MultiKill">
															<span class="Kill">더블킬</span>
														</div>
														<div class="Badge">
															<span class="Text MVP">MVP</span>
														</div>
													</div>
													<div class="Stats">
														<div class="Level">레벨18</div>
														<div class="CS">
															<span class="CS tip"
																title="미니언 340  + 몬스터 39<br>분당CS 9.8개">379 (9.8)</span>
															CS
														</div>
														<div class="CKRate tip" title="킬관여율">킬관여 89%</div>
														<div class="MMR">
															<span>매치 평균</span> <br> <b>Grandmaster</b>
														</div>
													</div>
													<div class="Items">
														<div class="ItemList">
															<div class="Item">
																<img
																	src="//opgg-static.akamaized.net/images/lol/item/3040.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #00cfbc'>대천사의 포옹</b><br><span><stats>주문력 +50<br><mana>마나 +1400</mana><br>재사용 대기시간 감소 +10%</stats><br><br><unique>고유 지속 효과 - 가속:</unique> 재사용 대기시간이 추가로 10% 감소합니다.<br><mana><unique>고유 지속 효과 - 경탄:</unique> 최대 마나의 3%만큼 주문력이 오릅니다. 마나를 소모하면 소모량의 25%를 돌려받습니다.</mana><br><active>고유 사용 효과 - 마나 보호막:</active> 현재 마나의 15%를 소모하여 2초 동안 150 + 마나 소모량에 해당하는 피해를 흡수하는 보호막을 씌웁니다. (재사용 대기시간 120초)<br><br><groupLimit>여신의 눈물 계열 아이템 소지 개수는 1개로 제한됩니다.</groupLimit></span><br><span>가격:</span> <span style='color: #ffc659'>3200 (3200)</span>"
																	alt="대천사의 포옹">
															</div>
															<div class="Item">
																<img
																	src="//opgg-static.akamaized.net/images/lol/item/3157.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #00cfbc'>존야의 모래시계</b><br><span>사용하면 아무런 행동도 취할 수 없는 대신 공격도 받지 않는 무적 상태가 됩니다.</span><br><span><stats>주문력 +75<br>방어력 +45<br>재사용 대기시간 감소 +10%</stats><br><br><active>고유 사용 효과 - 경직:</active> 챔피언이 2.5초 동안 아무런 행동도 취할 수 없는 대신 공격도 받지 않는 무적 상태가 됩니다. (재사용 대기시간 120초)</span><br><span>가격:</span> <span style='color: #ffc659'>2900 (250)</span>"
																	alt="존야의 모래시계">
															</div>
															<div class="Item">
																<img
																	src="//opgg-static.akamaized.net/images/lol/item/3135.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #00cfbc'>공허의 지팡이</b><br><span>마법 피해량이 증가합니다.</span><br><span><stats>주문력 +70</stats><br><br><unique>고유 지속 효과 - 분해:</unique> <a href=&quot;#&quot;>마법 관통력</a> +40%</span><br><span>가격:</span> <span style='color: #ffc659'>2650 (1365)</span>"
																	alt="공허의 지팡이">
															</div>
															<div class="Item">
																<img
																	src="//opgg-static.akamaized.net/images/lol/item/3363.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #00cfbc'>망원형 개조</b><br><span>설치 범위가 증가하며 대상 지역을 드러내 줍니다.</span><br><span><levelLimit>업그레이드하려면 9레벨 이상이 되어야 합니다.</levelLimit><br><groupLimit>장신구 소지 개수는 1개로 제한됩니다.</groupLimit><br><br><font color='#FFFFFF'>와드 토템</font> 장신구 업그레이드 시:<br><br><stats><font color='#00FF00'>+</font> 설치 가능 범위 대폭(+650%) 증가<br><font color='#00FF00'>+</font> 지속시간 제한 없음, 와드 설치 개수 제한에 관계 없음<br><font color='#FF0000'>-</font> <font color='#FF6600'>재사용 대기시간 10% 증가</font><br><font color='#FF0000'>-</font> <font color='#FF6600'>누구나 볼 수 있는 와드로, 파괴 가능하고 아군의 대상으로 지정 불가</font><br><font color='#FF0000'>-</font> <font color='#FF6600'>와드 시야 범위 45% 감소</font><br><font color='#FF0000'>-</font> <font color='#FF6600'>상점 방문 시 충전되지 않음</font></stats></span>"
																	alt="망원형 개조">
															</div>
															<div class="Item">
																<img
																	src="//opgg-static.akamaized.net/images/lol/item/3089.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #00cfbc'>라바돈의 죽음모자</b><br><span>주문력이 대폭 상승합니다.</span><br><span><stats>주문력 +120  </stats><br><br><unique>고유 지속 효과:</unique> 주문력이 40% 상승합니다.</span><br><span>가격:</span> <span style='color: #ffc659'>3600 (1100)</span>"
																	alt="라바돈의 죽음모자">
															</div>
															<div class="Item">
																<img
																	src="//opgg-static.akamaized.net/images/lol/item/3027.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #00cfbc'>영겁의 지팡이</b><br><span>체력, 마나, 주문력이 크게 증가합니다.</span><br><span><stats>체력 +300<br><mana>마나 +300</mana><br>주문력 +60</stats><br><br><passive>기본 지속 효과:</passive> 매 중첩당 체력 +20, 마나 +10, 주문력 +4의 능력치를 올려줍니다. (최대 체력 +200, 마나 +100, 주문력 +40) 매 분당 중첩이 1 오릅니다. (최대 중첩 수 10)<br><unique>고유 지속 효과 - 영원:</unique> 챔피언으로부터 입은 피해의 15%를 마나로 돌려받습니다. 마나 소모 시 20%를 체력으로 돌려받습니다. (스킬 사용 1회당 최대 25까지)</span><br><span>가격:</span> <span style='color: #ffc659'>2600 (650)</span>"
																	alt="영겁의 지팡이">
															</div>
															<div class="Item">
																<img
																	src="//opgg-static.akamaized.net/images/lol/item/3165.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #00cfbc'>모렐로노미콘</b><br><span>마법 피해량이 증가합니다.</span><br><span><stats>주문력 +70<br>체력 +300</stats><br><br><unique>고유 지속 효과- 죽음의 감촉:</unique> <a href=&quot;#&quot;>마법 관통력</a> +15<br><unique>고유 지속 효과- 저주받은 일격:</unique> 챔피언에게 마법 피해를 가하면 3초 동안 <a href=&quot;#&quot;>고통스러운 상처</a> 효과를 적용합니다.</span><br><span>가격:</span> <span style='color: #ffc659'>3000 (550)</span>"
																	alt="모렐로노미콘">
															</div>
															<button class="Button OpenBuildButton tip" title="빌드"
																type="button">
																<img class="On"
																	src="//opgg-static.akamaized.net/css3/sprite/images/icon-buildblue-p.png">
																<img class="Off"
																	src="//opgg-static.akamaized.net/css3/sprite/images/icon-buildblue-p.png">
															</button>
														</div>
														<div class="Trinket">
															<img
																src="//opgg-static.akamaized.net/images/site/summoner/icon-ward-blue.png">
															제어 와드 <span class="wards vision">13</span>
														</div>
													</div>
													<div class="FollowPlayers Names">
														<div class="Team">
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-66 tip"
																		title="루시안">루시안</div>
																	<div class="Image20 __sprite __spc20 __spc20-66 tip"
																		title="루시안">루시안</div>
																</div>
																<div class="SummonerName">
																	<a
																		href="//www.op.gg/summoner/userName=%EA%B0%84%EB%8B%A4%EB%9D%BC%EC%BF%A4%EB%8B%A4"
																		class="Link" target="_blank">간다라쿤다</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-25 tip"
																		title="엘리스">엘리스</div>
																	<div class="Image20 __sprite __spc20 __spc20-25 tip"
																		title="엘리스">엘리스</div>
																</div>
																<div class="SummonerName">
																	<a href="//www.op.gg/summoner/userName=BRB+Mightybear"
																		class="Link" target="_blank">BRB Mightybear</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-145 tip"
																		title="제드">제드</div>
																	<div class="Image20 __sprite __spc20 __spc20-145 tip"
																		title="제드">제드</div>
																</div>
																<div class="SummonerName">
																	<a
																		href="//www.op.gg/summoner/userName=%EB%82%98%EB%9D%BC%EC%B9%B4%EC%9D%BC"
																		class="Link" target="_blank">나라카일</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-27 tip"
																		title="이즈리얼">이즈리얼</div>
																	<div class="Image20 __sprite __spc20 __spc20-27 tip"
																		title="이즈리얼">이즈리얼</div>
																</div>
																<div class="SummonerName">
																	<a
																		href="//www.op.gg/summoner/userName=%ED%9B%88%EB%A0%A8%EB%B3%91+%EB%A0%88%EC%9D%B4%EB%8B%9D"
																		class="Link" target="_blank">훈련병 레이닝</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-120 tip"
																		title="쓰레쉬">쓰레쉬</div>
																	<div class="Image20 __sprite __spc20 __spc20-120 tip"
																		title="쓰레쉬">쓰레쉬</div>
																</div>
																<div class="SummonerName">
																	<a
																		href="//www.op.gg/summoner/userName=%ED%8C%A1%ED%8C%A1%ED%82%A4%ED%82%A4"
																		class="Link" target="_blank">팡팡키키</a>
																</div>
															</div>
														</div>
														<div class="Team">
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-91 tip"
																		title="퀸">퀸</div>
																	<div class="Image20 __sprite __spc20 __spc20-91 tip"
																		title="퀸">퀸</div>
																</div>
																<div class="SummonerName">
																	<a href="//www.op.gg/summoner/userName=dolcasa"
																		class="Link" target="_blank">dolcasa</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-64 tip"
																		title="릴리아">릴리아</div>
																	<div class="Image20 __sprite __spc20 __spc20-64 tip"
																		title="릴리아">릴리아</div>
																</div>
																<div class="SummonerName">
																	<a href="//www.op.gg/summoner/userName=LeeWangDui"
																		class="Link" target="_blank">LeeWangDui</a>
																</div>
															</div>
															<div class="Summoner Requester">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-17 tip"
																		title="카시오페아">카시오페아</div>
																	<div class="Image20 __sprite __spc20 __spc20-17 tip"
																		title="카시오페아">카시오페아</div>
																</div>
																<div class="SummonerName">
																	<a href="//www.op.gg/summoner/userName=Hide+on+bush"
																		class="Link" target="_blank">Hide on bush</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-46 tip"
																		title="진">진</div>
																	<div class="Image20 __sprite __spc20 __spc20-46 tip"
																		title="진">진</div>
																</div>
																<div class="SummonerName">
																	<a href="//www.op.gg/summoner/userName=m0wgli"
																		class="Link" target="_blank">m0wgli</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-12 tip"
																		title="블리츠크랭크">블리츠크랭크</div>
																	<div class="Image20 __sprite __spc20 __spc20-12 tip"
																		title="블리츠크랭크">블리츠크랭크</div>
																</div>
																<div class="SummonerName">
																	<a href="//www.op.gg/summoner/userName=Mocha"
																		class="Link" target="_blank">Mocha</a>
																</div>
															</div>
														</div>
													</div>
													<div class="StatsButton">
														<div class="Content">
															<div class="Item">
																<a id="right_match_replay" href="#"
																	class="Button Replay OpenSpectateButton"> <span
																	class="__spSite __spSite-159"></span></a>
															</div>
															<div class="Item">
																<a id="right_match" href="#" class="Button MatchDetail">
																	<span class="__spSite __spSite-194 Off"></span> <span
																	class="__spSite __spSite-193 On"></span>
																</a>
															</div>
														</div>
													</div>
												</div>
												<div class="GameDetail"></div>
											</div>
										</div>
										<div class="GameItemWrap">
											<div class="GameItem Win  " data-summoner-id="4460427"
												data-game-time="1599237117" data-game-id="4623721699"
												data-game-result="win">
												<div class="Content">
													<div class="GameStats">
														<div class="GameType" title="솔랭">솔랭</div>
														<div class="TimeStamp">
															<span class="_timeago _timeCountAssigned tip"
																data-datetime="1599237117" data-type=""
																data-interval="60" title="2020년 9월 5일 오전 1시 54분">3일
																전</span>
														</div>
														<div class="Bar"></div>
														<div class="GameResult">승리</div>
														<div class="GameLength">32분 8초</div>

													</div>
													<div class="GameSettingInfo">
														<div class="ChampionImage">
															<a href="/champion/reksai/statistics" target="_blank"><img
																src="//opgg-static.akamaized.net/images/lol/champion/RekSai.png?image=q_auto,w_46&amp;v=1596679559"
																class="Image" alt="렉사이"></a>
														</div>

														<div class="SummonerSpell">
															<div class="Spell">
																<img
																	src="//opgg-static.akamaized.net/images/lol/spell/SummonerSmite.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #ffc659'>강타</b><br><span>대상 에픽 및 대형/중형 몬스터, 혹은 적 미니언에게 390~1,000(챔피언 레벨에 따라 변동)의 고정 피해를 입힙니다. 몬스터에게 사용하면 자신의 최대 체력에 비례해 체력을 회복합니다.</span>"
																	alt="강타">
															</div>
															<div class="Spell">
																<img
																	src="//opgg-static.akamaized.net/images/lol/spell/SummonerFlash.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #ffc659'>점멸</b><br><span>커서 방향으로 챔피언이 짧은 거리를 순간이동합니다.</span>"
																	alt="점멸">
															</div>
														</div>
														<div class="Runes">
															<div class="Rune">
																<img
																	src="//opgg-static.akamaized.net/images/lol/perk/9923.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #ffc659'>칼날비</b><br><span>적 챔피언에 대한 3번째 공격까지 공격 속도가 110% 증가합니다.<br><br>3초 안에 다음 공격을 가하지 못하면 효과가 사라집니다.<br><br>재사용 대기시간: 적 챔피언과의 전투에서 벗어나면 8초의 재사용 대기시간이 적용됩니다.<br><br><rules>기본 공격 모션이 취소될 경우 공격 속도 증가 효과가 적용되는 공격 횟수가 1회 늘어납니다.<br>일시적으로 최고 공격 속도 제한을 초과할 수 있습니다.</rules></span>"
																	alt="칼날비">
															</div>
															<div class="Rune">
																<img
																	src="//opgg-static.akamaized.net/images/lol/perkStyle/8200.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #ffc659'>마법</b><br><span>스킬 및 광역 효과 강화</span>"
																	alt="마법">
															</div>
														</div>
														<div class="ChampionName">
															<a href="/champion/reksai/statistics" target="_blank">렉사이</a>
														</div>
													</div>
													<div class="KDA">
														<div class="KDA">
															<span class="Kill">6</span> / <span class="Death">2</span>
															/ <span class="Assist">8</span>
														</div>
														<div class="KDARatio">
															<span class="KDARatio ">7.00:1</span> 평점
														</div>
														<div class="Badge">
															<span class="Text MVP">MVP</span>
														</div>
													</div>
													<div class="Stats">
														<div class="Level">레벨17</div>
														<div class="CS">
															<span class="CS tip"
																title="미니언 52  + 몬스터 207<br>분당CS 8.1개">259 (8.1)</span>
															CS
														</div>
														<div class="CKRate tip" title="킬관여율">킬관여 54%</div>
														<div class="MMR">
															<span>매치 평균</span> <br> <b>Grandmaster</b>
														</div>
													</div>
													<div class="Items">
														<div class="ItemList">
															<div class="Item">
																<img
																	src="//opgg-static.akamaized.net/images/lol/item/3143.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #00cfbc'>란두인의 예언</b><br><span>방어력이 대폭 강화됩니다. 사용하면 주변 적들이 둔화에 걸립니다.</span><br><span><stats>체력 +400<br>방어력 +70</stats><br><br><unique>고유 지속 효과:</unique>기본 공격 치명타로 입는 피해량 -20%<br><unique>고유 지속 효과 - 차가운 강철:</unique>기본 공격에 맞으면 1초 동안 공격한 챔피언의 공격 속도가 15% 감소합니다.<br><active>고유 사용 효과:</active> 주변 적 유닛의 이동 속도를 2초 동안 55%만큼 둔화시킵니다. (재사용 대기시간 60초)</span><br><span>가격:</span> <span style='color: #ffc659'>2900 (900)</span>"
																	alt="란두인의 예언">
															</div>
															<div class="Item">
																<img
																	src="//opgg-static.akamaized.net/images/lol/item/3134.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #00cfbc'>톱날 단검</b><br><span>공격력과 물리 관통력이 증가합니다.</span><br><span><stats>공격력 +30</stats><br><br><unique>고유 지속 효과:</unique> <a href=&quot;#&quot;>물리 관통력</a> +10<br></span><br><span>가격:</span> <span style='color: #ffc659'>1100 (400)</span>"
																	alt="톱날 단검">
															</div>
															<div class="Item">
																<img
																	src="//opgg-static.akamaized.net/images/lol/item/1400.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #00cfbc'>마법 부여: 용사</b><br><span>공격력이 증가하고 재사용 대기시간이 감소합니다.</span><br><span><stats>공격력 +60<br>재사용 대기시간 감소 +10%</stats><br><br><groupLimit>골드 획득 아이템이나 정글 아이템은 1개로 소지가 제한됩니다.</groupLimit></span><br><span>가격:</span> <span style='color: #ffc659'>2625 (525)</span>"
																	alt="마법 부여: 용사">
															</div>
															<div class="Item">
																<img
																	src="//opgg-static.akamaized.net/images/lol/item/3364.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #00cfbc'>예언자의 렌즈</b><br><span>근처의 투명한 와드와 덫을 일정 시간 동안 차단합니다.</span><br><span><groupLimit>장신구 소지 개수는 1개로 제한됩니다.</groupLimit><br><br><active>사용 시:</active> 10초 동안 근처를 수색해 적 유닛이 숨어 있으면 경고를 보내며 주변의 투명한 덫과 와드를 드러내고, 추가로 와드를 무력화시킵니다. (재사용 대기시간 90~60초)</span>"
																	alt="예언자의 렌즈">
															</div>
															<div class="Item">
																<img
																	src="//opgg-static.akamaized.net/images/lol/item/3111.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #00cfbc'>헤르메스의 발걸음</b><br><span>이동 속도가 증가하고, 방해 효과의 지속시간이 줄어듭니다.</span><br><span><groupLimit>1개만 구입 가능합니다.</groupLimit><br><br><stats>마법 저항력 +25</stats><br><br><unique>고유 지속 효과 - 이동 속도 향상:</unique> 이동 속도 +45<br><unique>고유 지속 효과 - 강인함:</unique> 기절, 둔화, 도발, 공포, 침묵, 실명, 변이 및 이동 불가 효과의 지속시간이 30% 감소합니다.</span><br><span>가격:</span> <span style='color: #ffc659'>1100 (350)</span>"
																	alt="헤르메스의 발걸음">
															</div>
															<div class="Item">
																<img
																	src="//opgg-static.akamaized.net/images/lol/item/3026.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #00cfbc'>수호 천사</b><br><span>주기적으로 챔피언 사망 시 부활시켜 줍니다.</span><br><span><stats>공격력 +45<br>방어력 +40</stats><br><br><unique>고유 지속 효과:</unique> 치명적인 피해를 입으면 4초 동안 경직에 걸린 다음 기본 체력의 50%, 최대 마나의 30%를 회복합니다. (재사용 대기시간 300초)</span><br><span>가격:</span> <span style='color: #ffc659'>2800 (50)</span>"
																	alt="수호 천사">
															</div>
															<div class="Item">
																<img
																	src="//opgg-static.akamaized.net/images/lol/item/1037.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #00cfbc'>곡괭이</b><br><span>공격력이 상당히 증가합니다.</span><br><span><stats>공격력 +25</stats></span><br><span>가격:</span> <span style='color: #ffc659'>875 (875)</span>"
																	alt="곡괭이">
															</div>
															<button class="Button OpenBuildButton tip" title="빌드"
																type="button">
																<img class="On"
																	src="//opgg-static.akamaized.net/css3/sprite/images/icon-buildblue-p.png">
																<img class="Off"
																	src="//opgg-static.akamaized.net/css3/sprite/images/icon-buildblue-p.png">
															</button>
														</div>
														<div class="Trinket">
															<img
																src="//opgg-static.akamaized.net/images/site/summoner/icon-ward-blue.png">
															제어 와드 <span class="wards vision">7</span>
														</div>
													</div>
													<div class="FollowPlayers Names">
														<div class="Team">
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-66 tip"
																		title="루시안">루시안</div>
																	<div class="Image20 __sprite __spc20 __spc20-66 tip"
																		title="루시안">루시안</div>
																</div>
																<div class="SummonerName">
																	<a href="//www.op.gg/summoner/userName=HUYATV+Garam"
																		class="Link" target="_blank">HUYATV Garam</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-35 tip"
																		title="그라가스">그라가스</div>
																	<div class="Image20 __sprite __spc20 __spc20-35 tip"
																		title="그라가스">그라가스</div>
																</div>
																<div class="SummonerName">
																	<a
																		href="//www.op.gg/summoner/userName=%EC%95%84%EB%9D%BC%EA%B0%80%ED%82%A4+%EC%9C%A0%EC%9D%B4"
																		class="Link" target="_blank">아라가키 유이</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-141 tip"
																		title="요네">요네</div>
																	<div class="Image20 __sprite __spc20 __spc20-141 tip"
																		title="요네">요네</div>
																</div>
																<div class="SummonerName">
																	<a
																		href="//www.op.gg/summoner/userName=iG%EB%A3%A8%ED%82%A4"
																		class="Link" target="_blank">iG루키</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-8 tip"
																		title="애쉬">애쉬</div>
																	<div class="Image20 __sprite __spc20 __spc20-8 tip"
																		title="애쉬">애쉬</div>
																</div>
																<div class="SummonerName">
																	<a
																		href="//www.op.gg/summoner/userName=%EC%A7%84+%EB%82%98+%EC%A1%B0+%EC%95%84"
																		class="Link" target="_blank">진 나 조 아</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-14 tip"
																		title="브라움">브라움</div>
																	<div class="Image20 __sprite __spc20 __spc20-14 tip"
																		title="브라움">브라움</div>
																</div>
																<div class="SummonerName">
																	<a href="//www.op.gg/summoner/userName=HUYATV+UMC"
																		class="Link" target="_blank">HUYATV UMC</a>
																</div>
															</div>
														</div>
														<div class="Team">
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-45 tip"
																		title="제이스">제이스</div>
																	<div class="Image20 __sprite __spc20 __spc20-45 tip"
																		title="제이스">제이스</div>
																</div>
																<div class="SummonerName">
																	<a href="//www.op.gg/summoner/userName=Gen+G+Meaning"
																		class="Link" target="_blank">Gen G Meaning</a>
																</div>
															</div>
															<div class="Summoner Requester">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-94 tip"
																		title="렉사이">렉사이</div>
																	<div class="Image20 __sprite __spc20 __spc20-94 tip"
																		title="렉사이">렉사이</div>
																</div>
																<div class="SummonerName">
																	<a href="//www.op.gg/summoner/userName=Hide+on+bush"
																		class="Link" target="_blank">Hide on bush</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-2 tip"
																		title="아칼리">아칼리</div>
																	<div class="Image20 __sprite __spc20 __spc20-2 tip"
																		title="아칼리">아칼리</div>
																</div>
																<div class="SummonerName">
																	<a href="//www.op.gg/summoner/userName=White+Canvas"
																		class="Link" target="_blank">White Canvas</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-101 tip"
																		title="세나">세나</div>
																	<div class="Image20 __sprite __spc20 __spc20-101 tip"
																		title="세나">세나</div>
																</div>
																<div class="SummonerName">
																	<a
																		href="//www.op.gg/summoner/userName=dongshiyuanlizhi"
																		class="Link" target="_blank">dongshiyuanlizhi</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-79 tip"
																		title="노틸러스">노틸러스</div>
																	<div class="Image20 __sprite __spc20 __spc20-79 tip"
																		title="노틸러스">노틸러스</div>
																</div>
																<div class="SummonerName">
																	<a href="//www.op.gg/summoner/userName=+ke+da+ya+1hao"
																		class="Link" target="_blank"> ke da ya 1hao</a>
																</div>
															</div>
														</div>
													</div>
													<div class="StatsButton">
														<div class="Content">
															<div class="Item">
																<a id="right_match_replay" href="#"
																	class="Button Replay OpenSpectateButton"> <span
																	class="__spSite __spSite-159"></span></a>
															</div>
															<div class="Item">
																<a id="right_match" href="#" class="Button MatchDetail">
																	<span class="__spSite __spSite-194 Off"></span> <span
																	class="__spSite __spSite-193 On"></span>
																</a>
															</div>
														</div>
													</div>
												</div>
												<div class="GameDetail"></div>
											</div>
										</div>
										<div class="GameItemWrap">
											<div class="GameItem Lose  " data-summoner-id="4460427"
												data-game-time="1599234840" data-game-id="4623636204"
												data-game-result="lose">
												<div class="Content">
													<div class="GameStats">
														<div class="GameType" title="솔랭">솔랭</div>
														<div class="TimeStamp">
															<span class="_timeago _timeCountAssigned tip"
																data-datetime="1599234840" data-type=""
																data-interval="60" title="2020년 9월 5일 오전 1시 16분">3일
																전</span>
														</div>
														<div class="Bar"></div>
														<div class="GameResult">패배</div>
														<div class="GameLength">19분 7초</div>

													</div>
													<div class="GameSettingInfo">
														<div class="ChampionImage">
															<a href="/champion/sylas/statistics" target="_blank"><img
																src="//opgg-static.akamaized.net/images/lol/champion/Sylas.png?image=q_auto,w_46&amp;v=1596679559"
																class="Image" alt="사일러스"></a>
														</div>

														<div class="SummonerSpell">
															<div class="Spell">
																<img
																	src="//opgg-static.akamaized.net/images/lol/spell/SummonerTeleport.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #ffc659'>순간이동</b><br><span>4초 동안 정신을 집중한 다음, 챔피언이 지정한 아군 구조물, 미니언, 혹은 와드로 순간이동하고 이동 속도가 증가합니다. 순간이동의 재사용 대기시간은 챔피언 레벨에 따라 420~240초입니다.</span>"
																	alt="순간이동">
															</div>
															<div class="Spell">
																<img
																	src="//opgg-static.akamaized.net/images/lol/spell/SummonerFlash.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #ffc659'>점멸</b><br><span>커서 방향으로 챔피언이 짧은 거리를 순간이동합니다.</span>"
																	alt="점멸">
															</div>
														</div>
														<div class="Runes">
															<div class="Rune">
																<img
																	src="//opgg-static.akamaized.net/images/lol/perk/8021.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #ffc659'>기민한 발놀림</b><br><span>공격 또는 이동 시 충전 중첩이 쌓입니다. 중첩이 100회 쌓이면 충전 상태로 다음 공격을 할 수 있습니다.<br><br>충전 상태로 공격 시 3~60(+추가 공격력의 0.3, +주문력의 0.3)에 해당하는 체력이 회복되며 1초 동안 이동 속도가 20% 증가합니다.<br><br>원거리 챔피언의 경우 미니언으로부터 받는 회복 효과가 20%만 적용됩니다.</span>"
																	alt="기민한 발놀림">
															</div>
															<div class="Rune">
																<img
																	src="//opgg-static.akamaized.net/images/lol/perkStyle/8300.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #ffc659'>영감</b><br><span>다양한 방식의 전투 보조</span>"
																	alt="영감">
															</div>
														</div>
														<div class="ChampionName">
															<a href="/champion/sylas/statistics" target="_blank">사일러스</a>
														</div>
													</div>
													<div class="KDA">
														<div class="KDA">
															<span class="Kill">3</span> / <span class="Death">3</span>
															/ <span class="Assist">2</span>
														</div>
														<div class="KDARatio">
															<span class="KDARatio ">1.67:1</span> 평점
														</div>
														<div class="Badge">
															<span class="Text ACE">ACE</span>
														</div>
													</div>
													<div class="Stats">
														<div class="Level">레벨12</div>
														<div class="CS">
															<span class="CS tip"
																title="미니언 137  + 몬스터 10<br>분당CS 7.7개">147 (7.7)</span>
															CS
														</div>
														<div class="CKRate tip" title="킬관여율">킬관여 56%</div>
														<div class="MMR">
															<span>매치 평균</span> <br> <b>Grandmaster</b>
														</div>
													</div>
													<div class="Items">
														<div class="ItemList">
															<div class="Item">
																<img
																	src="//opgg-static.akamaized.net/images/lol/item/3030.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #00cfbc'>마법공학 GLP-800</b><br><span>사용하면 얼어붙은 탄환을 발사해 적을 둔화시킵니다.</span><br><span><stats>주문력 +80<br><mana>마나 +600</mana><br>재사용 대기시간 감소 +10%</stats><br><br><unique>고유 지속 효과 - 가속:</unique> 재사용 대기시간이 추가로 10% 감소합니다.<br><unique>고유 사용 효과 - 서리 탄환:</unique> 유닛에게 최초 적중 시 폭발하는 얼음 탄환을 무더기로 발사해 적중하는 모든 적에게 <scaleLevel>100~200</scaleLevel> (+ 주문력의 20%)의 마법 피해를 입힙니다. (재사용 대기시간은 40초이며 다른 <font color='#9999FF'><a href=&quot;#&quot;>마법공학</a></font> 아이템과 재사용 대기시간을 공유합니다.)<br><br>적중당한 적은 65% 둔화되며 둔화 효과는 2초에 걸쳐 사라집니다.</span><br><span>가격:</span> <span style='color: #ffc659'>2800 (450)</span>"
																	alt="마법공학 GLP-800">
															</div>
															<div class="Item">
																<img
																	src="//opgg-static.akamaized.net/images/lol/item/3157.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #00cfbc'>존야의 모래시계</b><br><span>사용하면 아무런 행동도 취할 수 없는 대신 공격도 받지 않는 무적 상태가 됩니다.</span><br><span><stats>주문력 +75<br>방어력 +45<br>재사용 대기시간 감소 +10%</stats><br><br><active>고유 사용 효과 - 경직:</active> 챔피언이 2.5초 동안 아무런 행동도 취할 수 없는 대신 공격도 받지 않는 무적 상태가 됩니다. (재사용 대기시간 120초)</span><br><span>가격:</span> <span style='color: #ffc659'>2900 (250)</span>"
																	alt="존야의 모래시계">
															</div>
															<div class="Item">
																<div class="Image NoItem"></div>
															</div>
															<div class="Item">
																<img
																	src="//opgg-static.akamaized.net/images/lol/item/3340.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #00cfbc'>와드 토템 (장신구)</b><br><span>주기적으로 투명 와드를 설치합니다.</span><br><span><groupLimit>장신구 소지 개수는 1개로 제한됩니다.</groupLimit><br><br><active>사용 시:</active> 충전량을 1회 소모하여 <scaleLevel>90 ~ 120</scaleLevel>초 동안 주변을 드러내 주는 보이지 않는 <font color='#BBFFFF'>투명 와드</font>를 설치합니다. <br><br>매 <scaleLevel>240 ~ 120</scaleLevel>초마다 1회 충전되며 최대 2회까지 충전됩니다.<br><br>와드 지속시간과 충전 주기는 레벨이 오를수록 향상됩니다.<br><br><rules>(플레이어당 맵에 설치할 수 있는 <font color='#BBFFFF'>투명 와드</font>는 3개로 제한됩니다.)</rules></span>"
																	alt="와드 토템 (장신구)">
															</div>
															<div class="Item">
																<img
																	src="//opgg-static.akamaized.net/images/lol/item/3020.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #00cfbc'>마법사의 신발</b><br><span>이동 속도와 마법 피해량이 증가합니다.</span><br><span><groupLimit>1개만 구입 가능합니다.</groupLimit><br><br><stats><a href=&quot;#&quot;>마법 관통력</a> +18</stats><br><br><unique>고유 지속 효과 - 이동 속도 향상:</unique> 이동 속도 +45</span><br><span>가격:</span> <span style='color: #ffc659'>1100 (800)</span>"
																	alt="마법사의 신발">
															</div>
															<div class="Item">
																<div class="Image NoItem"></div>
															</div>
															<div class="Item">
																<div class="Image NoItem"></div>
															</div>
															<button class="Button OpenBuildButton tip" title="빌드"
																type="button">
																<img class="On"
																	src="//opgg-static.akamaized.net/css3/sprite/images/icon-buildred-p.png">
																<img class="Off"
																	src="//opgg-static.akamaized.net/css3/sprite/images/icon-buildred-p.png">
															</button>
														</div>
														<div class="Trinket">
															<img
																src="//opgg-static.akamaized.net/images/site/summoner/icon-ward-red.png">
															제어 와드 <span class="wards vision">4</span>
														</div>
													</div>
													<div class="FollowPlayers Names">
														<div class="Team">
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-87 tip"
																		title="판테온">판테온</div>
																	<div class="Image20 __sprite __spc20 __spc20-87 tip"
																		title="판테온">판테온</div>
																</div>
																<div class="SummonerName">
																	<a href="//www.op.gg/summoner/userName=T1+Roamer"
																		class="Link" target="_blank">T1 Roamer</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-81 tip"
																		title="니달리">니달리</div>
																	<div class="Image20 __sprite __spc20 __spc20-81 tip"
																		title="니달리">니달리</div>
																</div>
																<div class="SummonerName">
																	<a
																		href="//www.op.gg/summoner/userName=%EB%91%90%EA%BA%BC%EB%B9%84%EC%95%95%EC%88%98"
																		class="Link" target="_blank">두꺼비압수</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-67 tip"
																		title="룰루">룰루</div>
																	<div class="Image20 __sprite __spc20 __spc20-67 tip"
																		title="룰루">룰루</div>
																</div>
																<div class="SummonerName">
																	<a
																		href="//www.op.gg/summoner/userName=%EA%B8%88%EC%B2%9C%EA%B5%AC+%EC%B9%BC%EB%82%A0%EC%A3%BC%EB%A8%B9"
																		class="Link" target="_blank">금천구 칼날주먹</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-73 tip"
																		title="미스 포츈">미스 포츈</div>
																	<div class="Image20 __sprite __spc20 __spc20-73 tip"
																		title="미스 포츈">미스 포츈</div>
																</div>
																<div class="SummonerName">
																	<a
																		href="//www.op.gg/summoner/userName=%EA%B2%8C%EB%B3%B5%EC%B9%98+%EC%88%9F%EA%B0%80%EB%9D%BD"
																		class="Link" target="_blank">게복치 숟가락</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-102 tip"
																		title="세트">세트</div>
																	<div class="Image20 __sprite __spc20 __spc20-102 tip"
																		title="세트">세트</div>
																</div>
																<div class="SummonerName">
																	<a
																		href="//www.op.gg/summoner/userName=%EB%A1%A4%EC%98%A4%EB%B8%8C%EB%A0%88%EC%A0%84%EB%93%9C1234"
																		class="Link" target="_blank">롤오브레전드1234</a>
																</div>
															</div>
														</div>
														<div class="Team">
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-2 tip"
																		title="아칼리">아칼리</div>
																	<div class="Image20 __sprite __spc20 __spc20-2 tip"
																		title="아칼리">아칼리</div>
																</div>
																<div class="SummonerName">
																	<a href="//www.op.gg/summoner/userName=T1+Fisher"
																		class="Link" target="_blank">T1 Fisher</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-36 tip"
																		title="그레이브즈">그레이브즈</div>
																	<div class="Image20 __sprite __spc20 __spc20-36 tip"
																		title="그레이브즈">그레이브즈</div>
																</div>
																<div class="SummonerName">
																	<a href="//www.op.gg/summoner/userName=xunxunxun"
																		class="Link" target="_blank">xunxunxun</a>
																</div>
															</div>
															<div class="Summoner Requester">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-113 tip"
																		title="사일러스">사일러스</div>
																	<div class="Image20 __sprite __spc20 __spc20-113 tip"
																		title="사일러스">사일러스</div>
																</div>
																<div class="SummonerName">
																	<a href="//www.op.gg/summoner/userName=Hide+on+bush"
																		class="Link" target="_blank">Hide on bush</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-8 tip"
																		title="애쉬">애쉬</div>
																	<div class="Image20 __sprite __spc20 __spc20-8 tip"
																		title="애쉬">애쉬</div>
																</div>
																<div class="SummonerName">
																	<a href="//www.op.gg/summoner/userName=Gen+G+Focus"
																		class="Link" target="_blank">Gen G Focus</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-35 tip"
																		title="그라가스">그라가스</div>
																	<div class="Image20 __sprite __spc20 __spc20-35 tip"
																		title="그라가스">그라가스</div>
																</div>
																<div class="SummonerName">
																	<a href="//www.op.gg/summoner/userName=T1+Crescent"
																		class="Link" target="_blank">T1 Crescent</a>
																</div>
															</div>
														</div>
													</div>
													<div class="StatsButton">
														<div class="Content">
															<div class="Item">
																<a id="right_match_replay" href="#"
																	class="Button Replay OpenSpectateButton"> <span
																	class="__spSite __spSite-159"></span></a>
															</div>
															<div class="Item">
																<a id="right_match" href="#" class="Button MatchDetail">
																	<span class="__spSite __spSite-198 Off"></span> <span
																	class="__spSite __spSite-197 On"></span>
																</a>
															</div>
														</div>
													</div>
												</div>
												<div class="GameDetail"></div>
											</div>
										</div>
										<div class="GameItemWrap">
											<div class="GameItem Win  " data-summoner-id="4460427"
												data-game-time="1599232950" data-game-id="4623488833"
												data-game-result="win">
												<div class="Content">
													<div class="GameStats">
														<div class="GameType" title="솔랭">솔랭</div>
														<div class="TimeStamp">
															<span class="_timeago _timeCountAssigned tip"
																data-datetime="1599232950" data-type=""
																data-interval="60" title="2020년 9월 5일 오전 12시 45분">3일
																전</span>
														</div>
														<div class="Bar"></div>
														<div class="GameResult">승리</div>
														<div class="GameLength">24분 4초</div>

													</div>
													<div class="GameSettingInfo">
														<div class="ChampionImage">
															<a href="/champion/kalista/statistics" target="_blank"><img
																src="//opgg-static.akamaized.net/images/lol/champion/Kalista.png?image=q_auto,w_46&amp;v=1596679559"
																class="Image" alt="칼리스타"></a>
														</div>

														<div class="SummonerSpell">
															<div class="Spell">
																<img
																	src="//opgg-static.akamaized.net/images/lol/spell/SummonerExhaust.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #ffc659'>탈진</b><br><span>적 챔피언을 지치게 만들어 3초 동안 이동 속도를 30% 느리게 하고 이 동안 가하는 피해량을 40% 낮춥니다.</span>"
																	alt="탈진">
															</div>
															<div class="Spell">
																<img
																	src="//opgg-static.akamaized.net/images/lol/spell/SummonerFlash.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #ffc659'>점멸</b><br><span>커서 방향으로 챔피언이 짧은 거리를 순간이동합니다.</span>"
																	alt="점멸">
															</div>
														</div>
														<div class="Runes">
															<div class="Rune">
																<img
																	src="//opgg-static.akamaized.net/images/lol/perk/9923.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #ffc659'>칼날비</b><br><span>적 챔피언에 대한 3번째 공격까지 공격 속도가 110% 증가합니다.<br><br>3초 안에 다음 공격을 가하지 못하면 효과가 사라집니다.<br><br>재사용 대기시간: 적 챔피언과의 전투에서 벗어나면 8초의 재사용 대기시간이 적용됩니다.<br><br><rules>기본 공격 모션이 취소될 경우 공격 속도 증가 효과가 적용되는 공격 횟수가 1회 늘어납니다.<br>일시적으로 최고 공격 속도 제한을 초과할 수 있습니다.</rules></span>"
																	alt="칼날비">
															</div>
															<div class="Rune">
																<img
																	src="//opgg-static.akamaized.net/images/lol/perkStyle/8000.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #ffc659'>정밀</b><br><span>공격 강화 및 지속적 피해</span>"
																	alt="정밀">
															</div>
														</div>
														<div class="ChampionName">
															<a href="/champion/kalista/statistics" target="_blank">칼리스타</a>
														</div>
													</div>
													<div class="KDA">
														<div class="KDA">
															<span class="Kill">4</span> / <span class="Death">3</span>
															/ <span class="Assist">5</span>
														</div>
														<div class="KDARatio">
															<span class="KDARatio ">3.00:1</span> 평점
														</div>
													</div>
													<div class="Stats">
														<div class="Level">레벨14</div>
														<div class="CS">
															<span class="CS tip"
																title="미니언 194  + 몬스터 17<br>분당CS 8.8개">211 (8.8)</span>
															CS
														</div>
														<div class="CKRate tip" title="킬관여율">킬관여 35%</div>
														<div class="MMR">
															<span>매치 평균</span> <br> <b>Grandmaster</b>
														</div>
													</div>
													<div class="Items">
														<div class="ItemList">
															<div class="Item">
																<img
																	src="//opgg-static.akamaized.net/images/lol/item/3153.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #00cfbc'>몰락한 왕의 검</b><br><span>상대의 체력에 비례하여 피해를 입히고, 상대의 이동 속도를 훔칠 수 있습니다.</span><br><span><stats>공격력 +40<br>공격 속도 +25%<br>생명력 흡수 +12%</stats><br><br><unique>고유 지속 효과:</unique> 기본 공격 적중 시 대상 현재 체력의 8%에 해당하는 추가 물리 피해를 입힙니다. (근접 챔피언은 12%)<br><active>고유 사용 효과:</active> 적 챔피언에게 100의 마법 피해를 입히고, 3초 동안 대상 이동 속도의 25%를 훔칩니다. (재사용 대기시간 90초)<br><br><rules>최소 15의 추가 물리 피해를 입힙니다.<br>몬스터 및 미니언에게 최대 60의 추가 물리 피해를 입힙니다.<br>사용자의 생명력 흡수가 입힌 추가 물리 피해에 적용됩니다.</rules></span><br><span>가격:</span> <span style='color: #ffc659'>3300 (700)</span>"
																	alt="몰락한 왕의 검">
															</div>
															<div class="Item">
																<img
																	src="//opgg-static.akamaized.net/images/lol/item/3046.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip tpd-delegation-uid-1" title=""
																	alt="유령 무희">
															</div>
															<div class="Item">
																<img
																	src="//opgg-static.akamaized.net/images/lol/item/3006.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip tpd-delegation-uid-1" title=""
																	alt="광전사의 군화">
															</div>
															<div class="Item">
																<img
																	src="//opgg-static.akamaized.net/images/lol/item/3363.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip tpd-delegation-uid-1" title=""
																	alt="망원형 개조">
															</div>
															<div class="Item">
																<img
																	src="//opgg-static.akamaized.net/images/lol/item/1053.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip tpd-delegation-uid-1" title=""
																	alt="흡혈의 낫">
															</div>
															<div class="Item">
																<img
																	src="//opgg-static.akamaized.net/images/lol/item/1038.png?image=q_auto,w_22&amp;v=1596679559"
																	class="Image tip"
																	title="<b style='color: #00cfbc'>B.F. 대검</b><br><span>공격력이 대폭 증가합니다.</span><br><span><stats>공격력 +40</stats></span><br><span>가격:</span> <span style='color: #ffc659'>1300 (1300)</span>"
																	alt="B.F. 대검">
															</div>
															<div class="Item">
																<div class="Image NoItem"></div>
															</div>
															<button
																class="Button OpenBuildButton tip tpd-delegation-uid-1"
																title="" type="button">
																<img class="On"
																	src="//opgg-static.akamaized.net/css3/sprite/images/icon-buildblue-p.png">
																<img class="Off"
																	src="//opgg-static.akamaized.net/css3/sprite/images/icon-buildblue-p.png">
															</button>
														</div>
														<div class="Trinket">
															<img
																src="//opgg-static.akamaized.net/images/site/summoner/icon-ward-blue.png">
															제어 와드 <span class="wards vision">1</span>
														</div>
													</div>
													<div class="FollowPlayers Names">
														<div class="Team">
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-29 tip"
																		title="피오라">피오라</div>
																	<div class="Image20 __sprite __spc20 __spc20-29 tip"
																		title="피오라">피오라</div>
																</div>
																<div class="SummonerName">
																	<a href="//www.op.gg/summoner/userName=K+CHEN+12"
																		class="Link" target="_blank">K CHEN 12</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-24 tip"
																		title="에코">에코</div>
																	<div class="Image20 __sprite __spc20 __spc20-24 tip"
																		title="에코">에코</div>
																</div>
																<div class="SummonerName">
																	<a href="//www.op.gg/summoner/userName=daye+lihai"
																		class="Link" target="_blank">daye lihai</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-66 tip"
																		title="루시안">루시안</div>
																	<div class="Image20 __sprite __spc20 __spc20-66 tip"
																		title="루시안">루시안</div>
																</div>
																<div class="SummonerName">
																	<a
																		href="//www.op.gg/summoner/userName=%EA%B3%B0%EB%8F%8C%EC%9D%B4+%ED%86%A0%EB%81%BC+%EC%9D%B8%ED%98%95"
																		class="Link" target="_blank">곰돌이 토끼 인형</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-8 tip"
																		title="애쉬">애쉬</div>
																	<div class="Image20 __sprite __spc20 __spc20-8 tip"
																		title="애쉬">애쉬</div>
																</div>
																<div class="SummonerName">
																	<a href="//www.op.gg/summoner/userName=fkyyyyy"
																		class="Link" target="_blank">fkyyyyy</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-149 tip"
																		title="자이라">자이라</div>
																	<div class="Image20 __sprite __spc20 __spc20-149 tip"
																		title="자이라">자이라</div>
																</div>
																<div class="SummonerName">
																	<a href="//www.op.gg/summoner/userName=beixinjie"
																		class="Link" target="_blank">beixinjie</a>
																</div>
															</div>
														</div>
														<div class="Team">
															<div class="Summoner Requester">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-49 tip"
																		title="칼리스타">칼리스타</div>
																	<div class="Image20 __sprite __spc20 __spc20-49 tip"
																		title="칼리스타">칼리스타</div>
																</div>
																<div class="SummonerName">
																	<a href="//www.op.gg/summoner/userName=Hide+on+bush"
																		class="Link" target="_blank">Hide on bush</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-25 tip"
																		title="엘리스">엘리스</div>
																	<div class="Image20 __sprite __spc20 __spc20-25 tip"
																		title="엘리스">엘리스</div>
																</div>
																<div class="SummonerName">
																	<a href="//www.op.gg/summoner/userName=qe0firugdfvi"
																		class="Link" target="_blank">qe0firugdfvi</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-54 tip"
																		title="케일">케일</div>
																	<div class="Image20 __sprite __spc20 __spc20-54 tip"
																		title="케일">케일</div>
																</div>
																<div class="SummonerName">
																	<a href="//www.op.gg/summoner/userName=HUYATV+Garam"
																		class="Link" target="_blank">HUYATV Garam</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-73 tip"
																		title="미스 포츈">미스 포츈</div>
																	<div class="Image20 __sprite __spc20 __spc20-73 tip"
																		title="미스 포츈">미스 포츈</div>
																</div>
																<div class="SummonerName">
																	<a
																		href="//www.op.gg/summoner/userName=%EC%9A%B0%EC%9A%B0%EB%A6%AC99"
																		class="Link" target="_blank">우우리99</a>
																</div>
															</div>
															<div class="Summoner ">
																<div class="ChampionImage">
																	<div class="Image16 __sprite __spc16 __spc16-67 tip"
																		title="룰루">룰루</div>
																	<div class="Image20 __sprite __spc20 __spc20-67 tip"
																		title="룰루">룰루</div>
																</div>
																<div class="SummonerName">
																	<a href="//www.op.gg/summoner/userName=HUYATV+UMC"
																		class="Link" target="_blank">HUYATV UMC</a>
																</div>
															</div>
														</div>
													</div>
													<div class="StatsButton">
														<div class="Content">
															<div class="Item">
																<a id="right_match_replay" href="#"
																	class="Button Replay OpenSpectateButton"> <span
																	class="__spSite __spSite-159"></span></a>
															</div>
															<div class="Item">
																<a id="right_match" href="#" class="Button MatchDetail">
																	<span class="__spSite __spSite-194 Off"></span> <span
																	class="__spSite __spSite-193 On"></span>
																</a>
															</div>
														</div>
													</div>
												</div>
												<div class="GameDetail"></div>
											</div>
										</div>
									</div>
									
					
				</div>
			</div>
		</div>
	</div>
</div>

<%@ include file="../part/foot.jspf"%>