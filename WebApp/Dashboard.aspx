<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true"
    CodeBehind="Dashboard.aspx.cs" Inherits="exam.Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
    <script src="https://code.jquery.com/ui/1.11.1/jquery-ui.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/chart.piecelabel.js/0.14.1/Chart.PieceLabel.min.js"></script>
<%--    <script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels@2.0.0"></script>--%>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.11.1/themes/smoothness/jquery-ui.css" />
    <%--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">--%>
    <%--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>--%>
    <%--<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>--%>

    <style>
        .ui-dialog {
            left: 50% !important;
            top: 10% !important;
            transform: translate(-50%, -10%) !important;
            background-color: rgba(255,255,255,0.5);
        }

            .ui-dialog .ui-dialog-content {
                width: 100% !important;
                overflow-y: scroll;
            }

        @font-face {
            font-family: "Glyphicons Halflings";
            src: url("../fonts/glyphicons-halflings-regular.eot");
            src: url("../fonts/glyphicons-halflings-regular.eot?#iefix") format("embedded-opentype"), url("../fonts/glyphicons-halflings-regular.woff2") format("woff2"), url("../fonts/glyphicons-halflings-regular.woff") format("woff"), url("../fonts/glyphicons-halflings-regular.ttf") format("truetype"), url("../fonts/glyphicons-halflings-regular.svg#glyphicons_halflingsregular") format("svg");
        }

        .glyphicon {
            position: relative;
            top: 1px;
            display: inline-block;
            font-family: "Glyphicons Halflings";
            font-style: normal;
            font-weight: 400;
            line-height: 1;
            -webkit-font-smoothing: antialiased;
            -moz-osx-font-smoothing: grayscale;
        }

        .glyphicon-asterisk:before {
            content: "\002a";
        }

        .glyphicon-plus:before {
            content: "\002b";
        }

        .glyphicon-euro:before,
        .glyphicon-eur:before {
            content: "\20ac";
        }

        .glyphicon-minus:before {
            content: "\2212";
        }

        .glyphicon-cloud:before {
            content: "\2601";
        }

        .glyphicon-envelope:before {
            content: "\2709";
        }

        .glyphicon-pencil:before {
            content: "\270f";
        }

        .glyphicon-glass:before {
            content: "\e001";
        }

        .glyphicon-music:before {
            content: "\e002";
        }

        .glyphicon-search:before {
            content: "\e003";
        }

        .glyphicon-heart:before {
            content: "\e005";
        }

        .glyphicon-star:before {
            content: "\e006";
        }

        .glyphicon-star-empty:before {
            content: "\e007";
        }

        .glyphicon-user:before {
            content: "\e008";
        }

        .glyphicon-film:before {
            content: "\e009";
        }

        .glyphicon-th-large:before {
            content: "\e010";
        }

        .glyphicon-th:before {
            content: "\e011";
        }

        .glyphicon-th-list:before {
            content: "\e012";
        }

        .glyphicon-ok:before {
            content: "\e013";
        }

        .glyphicon-remove:before {
            content: "\e014";
        }

        .glyphicon-zoom-in:before {
            content: "\e015";
        }

        .glyphicon-zoom-out:before {
            content: "\e016";
        }

        .glyphicon-off:before {
            content: "\e017";
        }

        .glyphicon-signal:before {
            content: "\e018";
        }

        .glyphicon-cog:before {
            content: "\e019";
        }

        .glyphicon-trash:before {
            content: "\e020";
        }

        .glyphicon-home:before {
            content: "\e021";
        }

        .glyphicon-file:before {
            content: "\e022";
        }

        .glyphicon-time:before {
            content: "\e023";
        }

        .glyphicon-road:before {
            content: "\e024";
        }

        .glyphicon-download-alt:before {
            content: "\e025";
        }

        .glyphicon-download:before {
            content: "\e026";
        }

        .glyphicon-upload:before {
            content: "\e027";
        }

        .glyphicon-inbox:before {
            content: "\e028";
        }

        .glyphicon-play-circle:before {
            content: "\e029";
        }

        .glyphicon-repeat:before {
            content: "\e030";
        }

        .glyphicon-refresh:before {
            content: "\e031";
        }

        .glyphicon-list-alt:before {
            content: "\e032";
        }

        .glyphicon-lock:before {
            content: "\e033";
        }

        .glyphicon-flag:before {
            content: "\e034";
        }

        .glyphicon-headphones:before {
            content: "\e035";
        }

        .glyphicon-volume-off:before {
            content: "\e036";
        }

        .glyphicon-volume-down:before {
            content: "\e037";
        }

        .glyphicon-volume-up:before {
            content: "\e038";
        }

        .glyphicon-qrcode:before {
            content: "\e039";
        }

        .glyphicon-barcode:before {
            content: "\e040";
        }

        .glyphicon-tag:before {
            content: "\e041";
        }

        .glyphicon-tags:before {
            content: "\e042";
        }

        .glyphicon-book:before {
            content: "\e043";
        }

        .glyphicon-bookmark:before {
            content: "\e044";
        }

        .glyphicon-print:before {
            content: "\e045";
        }

        .glyphicon-camera:before {
            content: "\e046";
        }

        .glyphicon-font:before {
            content: "\e047";
        }

        .glyphicon-bold:before {
            content: "\e048";
        }

        .glyphicon-italic:before {
            content: "\e049";
        }

        .glyphicon-text-height:before {
            content: "\e050";
        }

        .glyphicon-text-width:before {
            content: "\e051";
        }

        .glyphicon-align-left:before {
            content: "\e052";
        }

        .glyphicon-align-center:before {
            content: "\e053";
        }

        .glyphicon-align-right:before {
            content: "\e054";
        }

        .glyphicon-align-justify:before {
            content: "\e055";
        }

        .glyphicon-list:before {
            content: "\e056";
        }

        .glyphicon-indent-left:before {
            content: "\e057";
        }

        .glyphicon-indent-right:before {
            content: "\e058";
        }

        .glyphicon-facetime-video:before {
            content: "\e059";
        }

        .glyphicon-picture:before {
            content: "\e060";
        }

        .glyphicon-map-marker:before {
            content: "\e062";
        }

        .glyphicon-adjust:before {
            content: "\e063";
        }

        .glyphicon-tint:before {
            content: "\e064";
        }

        .glyphicon-edit:before {
            content: "\e065";
        }

        .glyphicon-share:before {
            content: "\e066";
        }

        .glyphicon-check:before {
            content: "\e067";
        }

        .glyphicon-move:before {
            content: "\e068";
        }

        .glyphicon-step-backward:before {
            content: "\e069";
        }

        .glyphicon-fast-backward:before {
            content: "\e070";
        }

        .glyphicon-backward:before {
            content: "\e071";
        }

        .glyphicon-play:before {
            content: "\e072";
        }

        .glyphicon-pause:before {
            content: "\e073";
        }

        .glyphicon-stop:before {
            content: "\e074";
        }

        .glyphicon-forward:before {
            content: "\e075";
        }

        .glyphicon-fast-forward:before {
            content: "\e076";
        }

        .glyphicon-step-forward:before {
            content: "\e077";
        }

        .glyphicon-eject:before {
            content: "\e078";
        }

        .glyphicon-chevron-left:before {
            content: "\e079";
        }

        .glyphicon-chevron-right:before {
            content: "\e080";
        }

        .glyphicon-plus-sign:before {
            content: "\e081";
        }

        .glyphicon-minus-sign:before {
            content: "\e082";
        }

        .glyphicon-remove-sign:before {
            content: "\e083";
        }

        .glyphicon-ok-sign:before {
            content: "\e084";
        }

        .glyphicon-question-sign:before {
            content: "\e085";
        }

        .glyphicon-info-sign:before {
            content: "\e086";
        }

        .glyphicon-screenshot:before {
            content: "\e087";
        }

        .glyphicon-remove-circle:before {
            content: "\e088";
        }

        .glyphicon-ok-circle:before {
            content: "\e089";
        }

        .glyphicon-ban-circle:before {
            content: "\e090";
        }

        .glyphicon-arrow-left:before {
            content: "\e091";
        }

        .glyphicon-arrow-right:before {
            content: "\e092";
        }

        .glyphicon-arrow-up:before {
            content: "\e093";
        }

        .glyphicon-arrow-down:before {
            content: "\e094";
        }

        .glyphicon-share-alt:before {
            content: "\e095";
        }

        .glyphicon-resize-full:before {
            content: "\e096";
        }

        .glyphicon-resize-small:before {
            content: "\e097";
        }

        .glyphicon-exclamation-sign:before {
            content: "\e101";
        }

        .glyphicon-gift:before {
            content: "\e102";
        }

        .glyphicon-leaf:before {
            content: "\e103";
        }

        .glyphicon-fire:before {
            content: "\e104";
        }

        .glyphicon-eye-open:before {
            content: "\e105";
        }

        .glyphicon-eye-close:before {
            content: "\e106";
        }

        .glyphicon-warning-sign:before {
            content: "\e107";
        }

        .glyphicon-plane:before {
            content: "\e108";
        }

        .glyphicon-calendar:before {
            content: "\e109";
        }

        .glyphicon-random:before {
            content: "\e110";
        }

        .glyphicon-comment:before {
            content: "\e111";
        }

        .glyphicon-magnet:before {
            content: "\e112";
        }

        .glyphicon-chevron-up:before {
            content: "\e113";
        }

        .glyphicon-chevron-down:before {
            content: "\e114";
        }

        .glyphicon-retweet:before {
            content: "\e115";
        }

        .glyphicon-shopping-cart:before {
            content: "\e116";
        }

        .glyphicon-folder-close:before {
            content: "\e117";
        }

        .glyphicon-folder-open:before {
            content: "\e118";
        }

        .glyphicon-resize-vertical:before {
            content: "\e119";
        }

        .glyphicon-resize-horizontal:before {
            content: "\e120";
        }

        .glyphicon-hdd:before {
            content: "\e121";
        }

        .glyphicon-bullhorn:before {
            content: "\e122";
        }

        .glyphicon-bell:before {
            content: "\e123";
        }

        .glyphicon-certificate:before {
            content: "\e124";
        }

        .glyphicon-thumbs-up:before {
            content: "\e125";
        }

        .glyphicon-thumbs-down:before {
            content: "\e126";
        }

        .glyphicon-hand-right:before {
            content: "\e127";
        }

        .glyphicon-hand-left:before {
            content: "\e128";
        }

        .glyphicon-hand-up:before {
            content: "\e129";
        }

        .glyphicon-hand-down:before {
            content: "\e130";
        }

        .glyphicon-circle-arrow-right:before {
            content: "\e131";
        }

        .glyphicon-circle-arrow-left:before {
            content: "\e132";
        }

        .glyphicon-circle-arrow-up:before {
            content: "\e133";
        }

        .glyphicon-circle-arrow-down:before {
            content: "\e134";
        }

        .glyphicon-globe:before {
            content: "\e135";
        }

        .glyphicon-wrench:before {
            content: "\e136";
        }

        .glyphicon-tasks:before {
            content: "\e137";
        }

        .glyphicon-filter:before {
            content: "\e138";
        }

        .glyphicon-briefcase:before {
            content: "\e139";
        }

        .glyphicon-fullscreen:before {
            content: "\e140";
        }

        .glyphicon-dashboard:before {
            content: "\e141";
        }

        .glyphicon-paperclip:before {
            content: "\e142";
        }

        .glyphicon-heart-empty:before {
            content: "\e143";
        }

        .glyphicon-link:before {
            content: "\e144";
        }

        .glyphicon-phone:before {
            content: "\e145";
        }

        .glyphicon-pushpin:before {
            content: "\e146";
        }

        .glyphicon-usd:before {
            content: "\e148";
        }

        .glyphicon-gbp:before {
            content: "\e149";
        }

        .glyphicon-sort:before {
            content: "\e150";
        }

        .glyphicon-sort-by-alphabet:before {
            content: "\e151";
        }

        .glyphicon-sort-by-alphabet-alt:before {
            content: "\e152";
        }

        .glyphicon-sort-by-order:before {
            content: "\e153";
        }

        .glyphicon-sort-by-order-alt:before {
            content: "\e154";
        }

        .glyphicon-sort-by-attributes:before {
            content: "\e155";
        }

        .glyphicon-sort-by-attributes-alt:before {
            content: "\e156";
        }

        .glyphicon-unchecked:before {
            content: "\e157";
        }

        .glyphicon-expand:before {
            content: "\e158";
        }

        .glyphicon-collapse-down:before {
            content: "\e159";
        }

        .glyphicon-collapse-up:before {
            content: "\e160";
        }

        .glyphicon-log-in:before {
            content: "\e161";
        }

        .glyphicon-flash:before {
            content: "\e162";
        }

        .glyphicon-log-out:before {
            content: "\e163";
        }

        .glyphicon-new-window:before {
            content: "\e164";
        }

        .glyphicon-record:before {
            content: "\e165";
        }

        .glyphicon-save:before {
            content: "\e166";
        }

        .glyphicon-open:before {
            content: "\e167";
        }

        .glyphicon-saved:before {
            content: "\e168";
        }

        .glyphicon-import:before {
            content: "\e169";
        }

        .glyphicon-export:before {
            content: "\e170";
        }

        .glyphicon-send:before {
            content: "\e171";
        }

        .glyphicon-floppy-disk:before {
            content: "\e172";
        }

        .glyphicon-floppy-saved:before {
            content: "\e173";
        }

        .glyphicon-floppy-remove:before {
            content: "\e174";
        }

        .glyphicon-floppy-save:before {
            content: "\e175";
        }

        .glyphicon-floppy-open:before {
            content: "\e176";
        }

        .glyphicon-credit-card:before {
            content: "\e177";
        }

        .glyphicon-transfer:before {
            content: "\e178";
        }

        .glyphicon-cutlery:before {
            content: "\e179";
        }

        .glyphicon-header:before {
            content: "\e180";
        }

        .glyphicon-compressed:before {
            content: "\e181";
        }

        .glyphicon-earphone:before {
            content: "\e182";
        }

        .glyphicon-phone-alt:before {
            content: "\e183";
        }

        .glyphicon-tower:before {
            content: "\e184";
        }

        .glyphicon-stats:before {
            content: "\e185";
        }

        .glyphicon-sd-video:before {
            content: "\e186";
        }

        .glyphicon-hd-video:before {
            content: "\e187";
        }

        .glyphicon-subtitles:before {
            content: "\e188";
        }

        .glyphicon-sound-stereo:before {
            content: "\e189";
        }

        .glyphicon-sound-dolby:before {
            content: "\e190";
        }

        .glyphicon-sound-5-1:before {
            content: "\e191";
        }

        .glyphicon-sound-6-1:before {
            content: "\e192";
        }

        .glyphicon-sound-7-1:before {
            content: "\e193";
        }

        .glyphicon-copyright-mark:before {
            content: "\e194";
        }

        .glyphicon-registration-mark:before {
            content: "\e195";
        }

        .glyphicon-cloud-download:before {
            content: "\e197";
        }

        .glyphicon-cloud-upload:before {
            content: "\e198";
        }

        .glyphicon-tree-conifer:before {
            content: "\e199";
        }

        .glyphicon-tree-deciduous:before {
            content: "\e200";
        }

        .glyphicon-cd:before {
            content: "\e201";
        }

        .glyphicon-save-file:before {
            content: "\e202";
        }

        .glyphicon-open-file:before {
            content: "\e203";
        }

        .glyphicon-level-up:before {
            content: "\e204";
        }

        .glyphicon-copy:before {
            content: "\e205";
        }

        .glyphicon-paste:before {
            content: "\e206";
        }

        .glyphicon-alert:before {
            content: "\e209";
        }

        .glyphicon-equalizer:before {
            content: "\e210";
        }

        .glyphicon-king:before {
            content: "\e211";
        }

        .glyphicon-queen:before {
            content: "\e212";
        }

        .glyphicon-pawn:before {
            content: "\e213";
        }

        .glyphicon-bishop:before {
            content: "\e214";
        }

        .glyphicon-knight:before {
            content: "\e215";
        }

        .glyphicon-baby-formula:before {
            content: "\e216";
        }

        .glyphicon-tent:before {
            content: "\26fa";
        }

        .glyphicon-blackboard:before {
            content: "\e218";
        }

        .glyphicon-bed:before {
            content: "\e219";
        }

        .glyphicon-apple:before {
            content: "\f8ff";
        }

        .glyphicon-erase:before {
            content: "\e221";
        }

        .glyphicon-hourglass:before {
            content: "\231b";
        }

        .glyphicon-lamp:before {
            content: "\e223";
        }

        .glyphicon-duplicate:before {
            content: "\e224";
        }

        .glyphicon-piggy-bank:before {
            content: "\e225";
        }

        .glyphicon-scissors:before {
            content: "\e226";
        }

        .glyphicon-bitcoin:before {
            content: "\e227";
        }

        .glyphicon-btc:before {
            content: "\e227";
        }

        .glyphicon-xbt:before {
            content: "\e227";
        }

        .glyphicon-yen:before {
            content: "\00a5";
        }

        .glyphicon-jpy:before {
            content: "\00a5";
        }

        .glyphicon-ruble:before {
            content: "\20bd";
        }

        .glyphicon-rub:before {
            content: "\20bd";
        }

        .glyphicon-scale:before {
            content: "\e230";
        }

        .glyphicon-ice-lolly:before {
            content: "\e231";
        }

        .glyphicon-ice-lolly-tasted:before {
            content: "\e232";
        }

        .glyphicon-education:before {
            content: "\e233";
        }

        .glyphicon-option-horizontal:before {
            content: "\e234";
        }

        .glyphicon-option-vertical:before {
            content: "\e235";
        }

        .glyphicon-menu-hamburger:before {
            content: "\e236";
        }

        .glyphicon-modal-window:before {
            content: "\e237";
        }

        .glyphicon-oil:before {
            content: "\e238";
        }

        .glyphicon-grain:before {
            content: "\e239";
        }

        .glyphicon-sunglasses:before {
            content: "\e240";
        }

        .glyphicon-text-size:before {
            content: "\e241";
        }

        .glyphicon-text-color:before {
            content: "\e242";
        }

        .glyphicon-text-background:before {
            content: "\e243";
        }

        .glyphicon-object-align-top:before {
            content: "\e244";
        }

        .glyphicon-object-align-bottom:before {
            content: "\e245";
        }

        .glyphicon-object-align-horizontal:before {
            content: "\e246";
        }

        .glyphicon-object-align-left:before {
            content: "\e247";
        }

        .glyphicon-object-align-vertical:before {
            content: "\e248";
        }

        .glyphicon-object-align-right:before {
            content: "\e249";
        }

        .glyphicon-triangle-right:before {
            content: "\e250";
        }

        .glyphicon-triangle-left:before {
            content: "\e251";
        }

        .glyphicon-triangle-bottom:before {
            content: "\e252";
        }

        .glyphicon-triangle-top:before {
            content: "\e253";
        }

        .glyphicon-console:before {
            content: "\e254";
        }

        .glyphicon-superscript:before {
            content: "\e255";
        }

        .glyphicon-subscript:before {
            content: "\e256";
        }

        .glyphicon-menu-left:before {
            content: "\e257";
        }

        .glyphicon-menu-right:before {
            content: "\e258";
        }

        .glyphicon-menu-down:before {
            content: "\e259";
        }

        .glyphicon-menu-up:before {
            content: "\e260";
        }

        .sr-only {
            position: absolute;
            width: 1px;
            height: 1px;
            padding: 0;
            margin: -1px;
            overflow: hidden;
            clip: rect(0, 0, 0, 0);
            border: 0;
        }

        .sr-only-focusable:active,
        .sr-only-focusable:focus {
            position: static;
            width: auto;
            height: auto;
            margin: 0;
            overflow: visible;
            clip: auto;
        }

        .carousel-inner > .item > img,
        .carousel-inner > .item > a > img {
            display: block;
            max-width: 100%;
            height: auto;
        }

        .carousel {
            position: relative;
        }

        .carousel-inner {
            position: relative;
            width: 100%;
            overflow: hidden;
        }

            .carousel-inner > .item {
                position: relative;
                display: none;
                -webkit-transition: 0.6s ease-in-out left;
                -o-transition: 0.6s ease-in-out left;
                transition: 0.6s ease-in-out left;
            }

                .carousel-inner > .item > img,
                .carousel-inner > .item > a > img {
                    line-height: 1;
                }

        @media all and (transform-3d), (-webkit-transform-3d) {
            .carousel-inner > .item {
                -webkit-transition: -webkit-transform 0.6s ease-in-out;
                -o-transition: -o-transform 0.6s ease-in-out;
                transition: -webkit-transform 0.6s ease-in-out;
                transition: transform 0.6s ease-in-out;
                transition: transform 0.6s ease-in-out, -webkit-transform 0.6s ease-in-out, -o-transform 0.6s ease-in-out;
                -webkit-backface-visibility: hidden;
                backface-visibility: hidden;
                -webkit-perspective: 1000px;
                perspective: 1000px;
            }

                .carousel-inner > .item.next,
                .carousel-inner > .item.active.right {
                    -webkit-transform: translate3d(100%, 0, 0);
                    transform: translate3d(100%, 0, 0);
                    left: 0;
                }

                .carousel-inner > .item.prev,
                .carousel-inner > .item.active.left {
                    -webkit-transform: translate3d(-100%, 0, 0);
                    transform: translate3d(-100%, 0, 0);
                    left: 0;
                }

                    .carousel-inner > .item.next.left,
                    .carousel-inner > .item.prev.right,
                    .carousel-inner > .item.active {
                        -webkit-transform: translate3d(0, 0, 0);
                        transform: translate3d(0, 0, 0);
                        left: 0;
                    }
        }

        .carousel-inner > .active,
        .carousel-inner > .next,
        .carousel-inner > .prev {
            display: block;
        }

        .carousel-inner > .active {
            left: 0;
        }

        .carousel-inner > .next,
        .carousel-inner > .prev {
            position: absolute;
            top: 0;
            width: 100%;
        }

        .carousel-inner > .next {
            left: 100%;
        }

        .carousel-inner > .prev {
            left: -100%;
        }

            .carousel-inner > .next.left,
            .carousel-inner > .prev.right {
                left: 0;
            }

        .carousel-inner > .active.left {
            left: -100%;
        }

        .carousel-inner > .active.right {
            left: 100%;
        }

        .carousel-control {
            position: absolute;
            top: 0;
            bottom: 0;
            left: 0;
            width: 15%;
            font-size: 20px;
            color: #fff;
            text-align: center;
            text-shadow: 0 1px 2px rgba(0, 0, 0, 0.6);
            background-color: rgba(0, 0, 0, 0);
            filter: alpha(opacity=50);
            opacity: 0.5;
        }

            .carousel-control.left {
                background-image: -webkit-linear-gradient(left, rgba(0, 0, 0, 0.5) 0%, rgba(0, 0, 0, 0.0001) 100%);
                background-image: -o-linear-gradient(left, rgba(0, 0, 0, 0.5) 0%, rgba(0, 0, 0, 0.0001) 100%);
                background-image: -webkit-gradient(linear, left top, right top, from(rgba(0, 0, 0, 0.5)), to(rgba(0, 0, 0, 0.0001)));
                background-image: linear-gradient(to right, rgba(0, 0, 0, 0.5) 0%, rgba(0, 0, 0, 0.0001) 100%);
                filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#80000000', endColorstr='#00000000', GradientType=1);
                background-repeat: repeat-x;
            }

            .carousel-control.right {
                right: 0;
                left: auto;
                background-image: -webkit-linear-gradient(left, rgba(0, 0, 0, 0.0001) 0%, rgba(0, 0, 0, 0.5) 100%);
                background-image: -o-linear-gradient(left, rgba(0, 0, 0, 0.0001) 0%, rgba(0, 0, 0, 0.5) 100%);
                background-image: -webkit-gradient(linear, left top, right top, from(rgba(0, 0, 0, 0.0001)), to(rgba(0, 0, 0, 0.5)));
                background-image: linear-gradient(to right, rgba(0, 0, 0, 0.0001) 0%, rgba(0, 0, 0, 0.5) 100%);
                filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#00000000', endColorstr='#80000000', GradientType=1);
                background-repeat: repeat-x;
            }

            .carousel-control:hover,
            .carousel-control:focus {
                color: #fff;
                text-decoration: none;
                outline: 0;
                filter: alpha(opacity=90);
                opacity: 0.9;
            }

            .carousel-control .icon-prev,
            .carousel-control .icon-next,
            .carousel-control .glyphicon-chevron-left,
            .carousel-control .glyphicon-chevron-right {
                position: absolute;
                top: 50%;
                z-index: 5;
                display: inline-block;
                margin-top: -10px;
            }

            .carousel-control .icon-prev,
            .carousel-control .glyphicon-chevron-left {
                left: 50%;
                margin-left: -10px;
            }

            .carousel-control .icon-next,
            .carousel-control .glyphicon-chevron-right {
                right: 50%;
                margin-right: -10px;
            }

            .carousel-control .icon-prev,
            .carousel-control .icon-next {
                width: 20px;
                height: 20px;
                font-family: serif;
                line-height: 1;
            }

                .carousel-control .icon-prev:before {
                    content: "\2039";
                }

                .carousel-control .icon-next:before {
                    content: "\203a";
                }

        .carousel-indicators {
            position: absolute;
            bottom: 10px;
            left: 50%;
            z-index: 15;
            width: 60%;
            padding-left: 0;
            margin-left: -30%;
            text-align: center;
            list-style: none;
        }

            .carousel-indicators li {
                display: inline-block;
                width: 10px;
                height: 10px;
                margin: 1px;
                text-indent: -999px;
                cursor: pointer;
                background-color: #000 \9;
                background-color: rgba(0, 0, 0, 0);
                border: 1px solid #fff;
                border-radius: 10px;
            }

            .carousel-indicators .active {
                width: 12px;
                height: 12px;
                margin: 0;
                background-color: #fff;
            }

        .carousel-caption {
            position: absolute;
            right: 15%;
            bottom: 20px;
            left: 15%;
            z-index: 10;
            padding-top: 20px;
            padding-bottom: 20px;
            color: #fff;
            text-align: center;
            text-shadow: 0 1px 2px rgba(0, 0, 0, 0.6);
        }

            .carousel-caption .btn {
                text-shadow: none;
            }

        @media screen and (min-width: 768px) {
            .carousel-control .glyphicon-chevron-left,
            .carousel-control .glyphicon-chevron-right,
            .carousel-control .icon-prev,
            .carousel-control .icon-next {
                width: 30px;
                height: 30px;
                margin-top: -10px;
                font-size: 30px;
            }

            .carousel-control .glyphicon-chevron-left,
            .carousel-control .icon-prev {
                margin-left: -10px;
            }

            .carousel-control .glyphicon-chevron-right,
            .carousel-control .icon-next {
                margin-right: -10px;
            }

            .carousel-caption {
                right: 20%;
                left: 20%;
                padding-bottom: 30px;
            }

            .carousel-indicators {
                bottom: 20px;
            }
        }

        .carousel-inner > .item > img,
        .carousel-inner > .item > a > img {
            width: 100%;
            margin: auto;
        }
        .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            padding: 0px; /* Location of the box */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
        }

        /* Modal Content */
        .modal-content {
            margin: auto;
            padding: 20px;
            /*border: 1px solid #888;*/
            width: 50%;
        }
        /* The Close Button */
        .close {
            color: #aaaaaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

            .close:hover,
            .close:focus {
                color: #000;
                text-decoration: none;
                cursor: pointer;
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<%--    <script>
        //Chart.defaults.set('plugins.datalabels', {
          //color: '#FE777B'
        });
    </script>--%>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <section class="flex-auto flex-col">
        <div id="myCarousel" class="carousel slide" style="height: 213px; overflow: hidden;">
            <!-- Indicators -->
            <ol class="carousel-indicators">
                 <li class="item1 active" style="display:<%= ConfigurationManager.AppSettings["DashbordBanner1Visisble"].ToString() %>"></li>
                <li class="item2" style="display:<%=ConfigurationManager.AppSettings["DashbordBanner2Visisble"].ToString() %>"></li>
                <li class="item3" style="display:<%= ConfigurationManager.AppSettings["DashbordBanner3Visisble"].ToString() %>"></li>
                <li class="item4" style="display:<%= ConfigurationManager.AppSettings["DashbordBanner4Visisble"].ToString() %>"></li>
                <li class="item5" style="display:<%= ConfigurationManager.AppSettings["DashbordBanner5Visisble"].ToString() %>"></li>
            </ol>

            <!-- Wrapper for slides -->
            <div class="carousel-inner" role="listbox" style="height: 250px;">

                <div class="item<%= ConfigurationManager.AppSettings["DashbordBanner1VisisbleImage"].ToString() %> active">
                    <img src="images/001.jpg" alt="" width="100%" height="250px">
                    <div class="carousel-caption">
                        <h3></h3>
                        <p></p>
                    </div>
                </div>

                <div class="item<%= ConfigurationManager.AppSettings["DashbordBanner2VisisbleImage"].ToString() %>">
                    <img src="images/002.jpg" alt="" width="100%" height="250px">
                    <div class="carousel-caption">
                        <h3></h3>
                        <p></p>
                    </div>
                </div>

                <div class="item<%= ConfigurationManager.AppSettings["DashbordBanner3VisisbleImage"].ToString() %>">
                    <img src="images/003.jpg" alt="" width="100%" height="250px">
                    <div class="carousel-caption">
                        <h3></h3>
                        <p></p>
                    </div>
                </div>

                <div class="item<%= ConfigurationManager.AppSettings["DashbordBanner4VisisbleImage"].ToString() %>">
                    <img src="images/004.jpg" alt="" width="100%" height="250px">
                    <div class="carousel-caption">
                        <h3></h3>
                        <p></p>
                    </div>
                </div>
               <div class="item<%= ConfigurationManager.AppSettings["DashbordBanner5VisisbleImage"].ToString() %>">
                    <img src="images/005.jpg" alt="" width="100%" height="250px">
                    <div class="carousel-caption d-hidden">
                        <h3></h3>
                        <p></p>
                    </div>
                </div>

            </div>

            <!-- Left and right controls -->
            <a class="left carousel-control" href="javascript:void(0)" role="button">
                <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="javascript:void(0)" role="button">
                <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
        
        <div class="col-12 flex-row flex-wrap mx-auto px-xs mt-sm">
            <div class="row-fluid col-12 col-12 lg:col-12 border" style="vertical-align: top;">
                <div>
                    <asp:GridView ID="grdState" CssClass="stacked table-zebra w-full text-center capitalize border-t border-default" runat="server" AutoGenerateColumns="false"
                        OnRowCommand="grdState_RowCommand" AlternatingRowStyle-CssClass="bg-light" Width="100%">
                        <%--   <PagerSettings Position="TopAndBottom" />
                                    <PagerStyle VerticalAlign="Bottom" />--%>
                        <EmptyDataTemplate>
                            <div align="center">
                                <h4>
                                    <label class="text-center text-danger f-size-2xs">
                                        No Data Found</label>
                                </h4>
                            </div>
                        </EmptyDataTemplate>
                        <Columns>
                            <asp:TemplateField HeaderText="" ItemStyle-CssClass="pl-thin text-left f-size-2xs" HeaderStyle-CssClass="pl-sm f-size-2xs f-color-secondary border-default border-b sr-header p-xs text-left" ItemStyle-Width="3%" HeaderStyle-Width="3%">
                                <ItemTemplate>
                                    <a id="a_<%#Container.DataItemIndex %>" class='btn btn-primary btnwidth2 cursor-pointer <%#Container.DataItemIndex == 0 ? "d-hidden" : "" %>' data-toggle="modal" data-target="#myModal" title='<%# Eval("District") %>'
                                        onclick="loadac('<%#exam.Common.Encode("010$"+ Eval("District").ToString()) %>',<%#Container.DataItemIndex %>,this,'','<%=grdDashboard.ClientID %>')">
                                        <span class="icon mr-xs flex-none f-color-primary">
                                            <span class="">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-down">
                                                    <polyline points="6 9 12 15 18 9"></polyline></svg></span>
                                        </span>
                                    </a>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="State" HeaderStyle-Width="35%" ItemStyle-CssClass="p-thin text-left f-size-2sm f-weight-semibold pl-sm" HeaderStyle-CssClass="pl-sm f-size-2xs f-color-secondary border-default border-b sr-header p-xs text-left">
                                <ItemTemplate><%# Eval("District") %></ItemTemplate>
                            </asp:TemplateField>
                            <%--<asp:TemplateField HeaderText="<%$appSettings:assemblyname%>" ItemStyle-CssClass="p-thin" HeaderStyle-CssClass="f-size-xxs f-color-secondary border-default border-b sr-header p-xs">
                                    <ItemTemplate><%# Eval("Acname") %></ItemTemplate>
                                </asp:TemplateField>--%>
                            <%--<asp:TemplateField HeaderText="TOTAL BOOTH" ItemStyle-CssClass="p-thin text-center f-size-xxs" HeaderStyle-CssClass="f-size-2xs f-color-secondary border-default border-b sr-header p-xs text-center">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lnkTotalBooth" Text='<%# Eval("TotalBooth") %>' runat="server" CssClass="no-underline" ForeColor="Green" Visible='<%# Eval("TotalBooth").ToString() != "0" %>' CommandName="TotalBooth" CommandArgument='<%# Eval("District") %>' />
                                            <asp:Label ID="lblTotalBooth" Text='<%# Eval("TotalBooth") %>' runat="server" ForeColor="Green" Visible='<%# Eval("TotalBooth").ToString() == "0" %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>--%>
                            <asp:TemplateField HeaderText="TOTAL" HeaderStyle-Width="20%" ItemStyle-CssClass="p-thin text-center f-size-2sm f-weight-semibold" HeaderStyle-CssClass="f-size-2xs f-color-secondary border-default border-b sr-header p-xs text-center">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkTotal" Text='<%# Eval("Total") %>' runat="server" CssClass="no-underline" ForeColor="Green" Visible='<%# Eval("Total").ToString() != "0" %>' CommandName="Total" CommandArgument='<%# Eval("District") %>' />
                                    <asp:Label ID="lblTotal" Text='<%# Eval("Total") %>' runat="server" ForeColor="Green" Visible='<%# Eval("Total").ToString() == "0" %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="ONLINE" HeaderStyle-Width="20%" ItemStyle-CssClass="p-thin text-center f-size-2sm f-weight-semibold" HeaderStyle-CssClass="f-size-2xs f-color-secondary border-default border-b sr-header p-xs text-center">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkOnline" Text='<%# Eval("online") %>' runat="server" CssClass="no-underline" ForeColor="Green" Visible='<%# Eval("online").ToString() != "0" %>' CommandName="Online" CommandArgument='<%# Eval("District") %>' />
                                    <asp:Label ID="lblOnline" Text='<%# Eval("online") %>' runat="server" ForeColor="Green" Visible='<%# Eval("online").ToString() == "0" %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="OFFLINE" HeaderStyle-Width="20%" ItemStyle-CssClass="p-thin text-center f-size-2sm f-weight-semibold" HeaderStyle-CssClass="f-size-2xs f-color-secondary border-default border-b sr-header p-xs text-center">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkOffline" Text='<%# Eval("offline") %>' runat="server" ForeColor="Red" CssClass="no-underline" Visible='<%# Eval("offline").ToString() != "0" %>' CommandName="Offline" CommandArgument='<%# Eval("District") %>' />
                                    <asp:Label ID="lblOffline" Text='<%# Eval("offline") %>' runat="server" ForeColor="Red" Visible='<%# Eval("offline").ToString() == "0" %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
        <div class="col-12 flex-row flex-wrap mx-auto px-xs mt-sm">
            <div class="row-fluid col-12 col-12 lg:col-12 pl-sm f-size-2xs f-color-secondary border sr-header p-xs text-center">
                DISTRICT WISE CONTRIBUTION DATA
            </div>
            <div class="<% if (  ConfigurationManager.AppSettings["pichartdisable"].ToString() == "1") { %> row-fluid col-6 col-6 lg:col-6 border <%} else { %> row-fluid col-6 col-6 lg:col-6 border<%} %>" style="vertical-align: top;">
                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>
                        <asp:GridView ID="grdDashboard" CssClass="stacked table-zebra w-full text-center capitalize border-t border-default" runat="server" AutoGenerateColumns="false"
                            OnRowCommand="grdDashboard_RowCommand" AlternatingRowStyle-CssClass="bg-light" Width="100%" OnRowDataBound="grdDashboard_RowDataBound">
                            <%--   <PagerSettings Position="TopAndBottom" />
                                    <PagerStyle VerticalAlign="Bottom" />--%>
                            <EmptyDataTemplate>
                                <div align="center">
                                    <h4>
                                        <label class="text-center text-danger f-size-2xs">
                                            No Data Found</label>
                                    </h4>
                                </div>
                            </EmptyDataTemplate>
                            <Columns>
                                <asp:TemplateField HeaderText="" ItemStyle-CssClass="pl-thin text-left f-size-xxs" HeaderStyle-CssClass="pl-sm f-size-2xs f-color-secondary border-default border-b sr-header p-xs text-left" ItemStyle-Width="3%" HeaderStyle-Width="3%">
                                    <ItemTemplate>
                                        <a id="a_<%#Container.DataItemIndex %>" class='btn btn-primary btnwidth2 cursor-pointer' data-toggle="modal" data-target="#myModal" title='<%# Eval("District") %>'
                                            onclick="loadac('<%#exam.Common.Encode("010$"+ Eval("District").ToString()) %>',<%#Container.DataItemIndex %>,this,'','<%=grdDashboard.ClientID %>')">
                                            <span class="icon mr-xs flex-none f-color-primary">
                                                <span class="">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-down">
                                                        <polyline points="6 9 12 15 18 9"></polyline></svg></span>
                                            </span>
                                        </a>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="DISTRICT" HeaderStyle-Width="35%" ItemStyle-CssClass="p-thin text-left f-size-xxs pl-sm" HeaderStyle-CssClass="pl-sm f-size-2xs f-color-secondary border-default border-b sr-header p-xs text-left">
                                    <ItemTemplate><%# Eval("District") %></ItemTemplate>
                                </asp:TemplateField>

                                <%--<asp:TemplateField HeaderText="<%$appSettings:assemblyname%>" ItemStyle-CssClass="p-thin" HeaderStyle-CssClass="f-size-xxs f-color-secondary border-default border-b sr-header p-xs">
                                    <ItemTemplate><%# Eval("Acname") %></ItemTemplate>
                                </asp:TemplateField>--%>
                                <%--<asp:TemplateField HeaderText="TOTAL BOOTH" ItemStyle-CssClass="p-thin text-center f-size-xxs" HeaderStyle-CssClass="f-size-2xs f-color-secondary border-default border-b sr-header p-xs text-center">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lnkTotalBooth" Text='<%# Eval("TotalBooth") %>' runat="server" CssClass="no-underline" ForeColor="Green" Visible='<%# Eval("TotalBooth").ToString() != "0" %>' CommandName="TotalBooth" CommandArgument='<%# Eval("District") %>' />
                                            <asp:Label ID="lblTotalBooth" Text='<%# Eval("TotalBooth") %>' runat="server" ForeColor="Green" Visible='<%# Eval("TotalBooth").ToString() == "0" %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>--%>
                                <asp:TemplateField HeaderText="COLOR CODE" HeaderStyle-Width="40%" ItemStyle-HorizontalAlign="Center" ItemStyle-CssClass="p-thin text-center f-size-xxs pl-sm" HeaderStyle-CssClass="pl-sm f-size-2xs f-color-secondary border-default border-b sr-header p-xs text-center">
                                    <ItemTemplate>
                                        <asp:HiddenField ID="hfColor" runat="server" Value='' />
                                        <asp:Label ID="lblColor" runat="server" CssClass="m-2" style="vertical-align: middle;">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="currentColor" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-circle" style="height:20px"><circle cx="12" cy="12" r="10"></circle></svg>
                                            <%--<i data-feather="circle" style="height:20px" fill="currentColor"></i>--%>
                                        </asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="TOTAL" HeaderStyle-Width="20%" ItemStyle-CssClass="p-thin text-center f-size-xxs" HeaderStyle-CssClass="f-size-2xs f-color-secondary border-default border-b sr-header p-xs text-center">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnkTotal" Text='<%# Eval("Total").ToString() %>' runat="server" CssClass="no-underline" ForeColor="Green" Visible='<%# Eval("Total").ToString() != "0" %>' CommandName="Total" CommandArgument='<%# Eval("District") %>' />
                                        <asp:Label ID="lblTotal" Text='<%# Eval("Total") %>' runat="server" ForeColor="Green" Visible='<%# Eval("Total").ToString() == "0" %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="ONLINE" HeaderStyle-Width="20%" ItemStyle-CssClass="p-thin text-center f-size-xxs" HeaderStyle-CssClass="f-size-2xs f-color-secondary border-default border-b sr-header p-xs text-center">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnkOnline" Text='<%# Eval("online").ToString() %>' runat="server" CssClass="no-underline" ForeColor="Green" Visible='<%# Eval("online").ToString() != "0" %>' CommandName="Online" CommandArgument='<%# Eval("District") %>' />
                                        <asp:Label ID="lblOnline" Text='<%# Eval("online") %>' runat="server" ForeColor="Green" Visible='<%# Eval("online").ToString() == "0" %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="OFFLINE" HeaderStyle-Width="20%" ItemStyle-CssClass="p-thin text-center f-size-xxs" HeaderStyle-CssClass="f-size-2xs f-color-secondary border-default border-b sr-header p-xs text-center">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnkOffline" Text='<%# Eval("offline").ToString() %>' runat="server" ForeColor="Red" CssClass="no-underline" Visible='<%# Eval("offline").ToString() != "0" %>' CommandName="Offline" CommandArgument='<%# Eval("District") %>' />
                                        <asp:Label ID="lblOffline" Text='<%# Eval("offline") %>' runat="server" ForeColor="Red" Visible='<%# Eval("offline").ToString() == "0" %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </ContentTemplate>
                    <Triggers>
                        <%--<asp:AsyncPostBackTrigger ControlID="btnShowData" EventName="Click" />--%>
                        <%--<asp:AsyncPostBackTrigger ControlID="btnCancel" EventName="Click" />--%>
                        <asp:AsyncPostBackTrigger ControlID="grdDashboard" EventName="RowCommand" />
                        <%--<asp:AsyncPostBackTrigger ControlID="ddlReasons" EventName="SelectedIndexChanged" />--%>
                    </Triggers>
                </asp:UpdatePanel>
            </div>
              <div class="row-fluid col-6 col-6 lg:col-6  border" style="vertical-align: top;">
                        <center>
                            <canvas id="BarChart" width="650" height="600"></canvas>
                        </center>
                    </div>
        <div class="<% if (ConfigurationManager.AppSettings["barchartdisable"].ToString() == "1" && ConfigurationManager.AppSettings["Indoor_Camera_List_disable"].ToString() == "1" &&ConfigurationManager.AppSettings["Outdoor_Camera_List_disable"].ToString() == "1")
            { %> d-hidden <%} %> col-12 flex-row flex-wrap mx-auto px-xs mt-sm">
            <div class="<% if (ConfigurationManager.AppSettings["barchartdisable"].ToString() == "1")
                { %> row-fluid col-6 col-6 lg:col-6 border <%}

                else
                { %> row-fluid col-6 col-6 lg:col-6 border d-hidden <% } %> " style="vertical-align: top;">
                <div class="col-6 flex-row flex-wrap mx-auto px-xs mt-sm">
                     <div class="<% if (ConfigurationManager.AppSettings["Indoor_Camera_List_disable"].ToString() == "0" && ConfigurationManager.AppSettings["Outdoor_Camera_List_disable"].ToString() == "1") { %> 
                        row-fluid col-6 col-6 lg:col-6 border
                        <% } else if(ConfigurationManager.AppSettings["Indoor_Camera_List_disable"].ToString() == "0" && ConfigurationManager.AppSettings["Outdoor_Camera_List_disable"].ToString() == "0") { %> 
                        row-fluid col-6 col-6 lg:col-6 border
                        <%} else{ %>
                          d-hidden row-fluid col-6 col-6 lg:col-6 border
                        <% } %>  " style="vertical-align: top;">
                        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                            <ContentTemplate>
                                <div style="height: 650px; overflow-y: auto;">
                                    <div class="pl-sm f-size-2xs f-color-secondary border-default border-y sr-header p-xs text-center">
                                        Indoor Camera List
                                    </div>
                                    <asp:GridView ID="grdIndoor" CssClass="stacked table-zebra w-full text-center capitalize border-t border-default" runat="server" AutoGenerateColumns="false"
                                        OnRowCommand="grdIndoor_RowCommand" AlternatingRowStyle-CssClass="bg-light" Width="100%">
                                        <%--   <PagerSettings Position="TopAndBottom" />
                                    <PagerStyle VerticalAlign="Bottom" />--%>
                                        <EmptyDataTemplate>
                                            <div align="center">
                                                <h4>
                                                    <label class="text-center text-danger f-size-2xs">
                                                        No Data Found</label>
                                                </h4>
                                            </div>
                                        </EmptyDataTemplate>
                                        <Columns>
                                            <asp:TemplateField HeaderText="" ItemStyle-CssClass="pl-thin text-left f-size-xxs" HeaderStyle-CssClass="pl-sm f-size-1xs f-color-secondary border-default border-b sr-header  text-left" ItemStyle-Width="3%" HeaderStyle-Width="3%">
                                                <ItemTemplate>
                                                    <a id="a_<%#Container.DataItemIndex %>" class='btn btn-primary btnwidth2 cursor-pointer' data-toggle="modal" data-target="#myModal" title='<%# Eval("District") %>'
                                                        onclick="loadac('<%#exam.Common.Encode("010$"+ Eval("District").ToString()) %>',<%#Container.DataItemIndex %>,this,'inside','<%=grdIndoor.ClientID %>')">
                                                        <span class="icon mr-xs flex-none f-color-primary">
                                                            <span class="">
                                                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-down">
                                                                    <polyline points="6 9 12 15 18 9"></polyline></svg></span>
                                                        </span>
                                                    </a>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="DISTRICT" HeaderStyle-Font-Size="8" ItemStyle-CssClass="p-thin text-left f-size-xxs pl-sm" HeaderStyle-CssClass="pl-sm f-size-1xs f-color-secondary border-default border-b sr-header  text-left" >
                                                <ItemTemplate><%# Eval("District") %></ItemTemplate>
                                            </asp:TemplateField>
                                            <%--<asp:TemplateField HeaderText="<%$appSettings:assemblyname%>" ItemStyle-CssClass="p-thin" HeaderStyle-CssClass="f-size-xxs f-color-secondary border-default border-b sr-header p-xs">
                                    <ItemTemplate><%# Eval("Acname") %></ItemTemplate>
                                </asp:TemplateField>--%>
                                            <%--<asp:TemplateField HeaderText="TOTAL BOOTH" ItemStyle-CssClass="p-thin text-center f-size-xxs" HeaderStyle-CssClass="f-size-1xs f-color-secondary border-default border-b sr-header p-xs text-center">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkTotalBooth" Text='<%# Eval("TotalBooth") %>' runat="server" CssClass="no-underline" ForeColor="Green" Visible='<%# Eval("TotalBooth").ToString() != "0" %>' CommandName="TotalBooth" CommandArgument='<%# Eval("District") %>' />
                                                    <asp:Label ID="lblTotalBooth" Text='<%# Eval("TotalBooth") %>' runat="server" ForeColor="Green" Visible='<%# Eval("TotalBooth").ToString() == "0" %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>--%>
                                            <asp:TemplateField HeaderText="TOTAL" HeaderStyle-Font-Size="8" ItemStyle-CssClass="p-thin text-center f-size-xxs" HeaderStyle-CssClass="f-size-1xs f-color-secondary border-default border-b sr-header  text-center">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkTotal" Text='<%# Eval("Total") %>' runat="server" CssClass="no-underline" ForeColor="Green" Visible='<%# Eval("Total").ToString() != "0" %>' CommandName="Total" CommandArgument='<%# Eval("District") %>' />
                                                    <asp:Label ID="lblTotal" Text='<%# Eval("Total") %>' runat="server" ForeColor="Green" Visible='<%# Eval("Total").ToString() == "0" %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="ONLINE" HeaderStyle-Font-Size="8" ItemStyle-CssClass="p-thin text-center f-size-xxs" HeaderStyle-CssClass="f-size-1xs f-color-secondary border-default border-b sr-header  text-center">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkOnline" Text='<%# Eval("online") %>' runat="server" CssClass="no-underline" ForeColor="Green" Visible='<%# Eval("online").ToString() != "0" %>' CommandName="Online" CommandArgument='<%# Eval("District") %>' />
                                                    <asp:Label ID="lblOnline" Text='<%# Eval("online") %>' runat="server" ForeColor="Green" Visible='<%# Eval("online").ToString() == "0" %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="OFFLINE" HeaderStyle-Font-Size="8" ItemStyle-CssClass="p-thin text-center f-size-xxs" HeaderStyle-CssClass="f-size-1xs f-color-secondary border-default border-b sr-header  text-center">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkOffline" Text='<%# Eval("offline") %>' runat="server" ForeColor="Red" CssClass="no-underline" Visible='<%# Eval("offline").ToString() != "0" %>' CommandName="Offline" CommandArgument='<%# Eval("District") %>' />
                                                    <asp:Label ID="lblOffline" Text='<%# Eval("offline") %>' runat="server" ForeColor="Red" Visible='<%# Eval("offline").ToString() == "0" %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </ContentTemplate>
                            <Triggers>
                                <%--<asp:AsyncPostBackTrigger ControlID="btnShowData" EventName="Click" />--%>
                                <%--<asp:AsyncPostBackTrigger ControlID="btnCancel" EventName="Click" />--%>
                                <asp:AsyncPostBackTrigger ControlID="grdIndoor" EventName="RowCommand" />
                                <%--<asp:AsyncPostBackTrigger ControlID="ddlReasons" EventName="SelectedIndexChanged" />--%>
                            </Triggers>
                        </asp:UpdatePanel>
                    </div>
                    <div class="<% if (ConfigurationManager.AppSettings["Indoor_Camera_List_disable"].ToString() == "1" && ConfigurationManager.AppSettings["Outdoor_Camera_List_disable"].ToString() == "0") { %> 
                        row-fluid col-12 col-12 lg:col-12 border
                        <% } else if (ConfigurationManager.AppSettings["Indoor_Camera_List_disable"].ToString() == "0" && ConfigurationManager.AppSettings["Outdoor_Camera_List_disable"].ToString() == "0") { %> 
                        row-fluid col-12 col-6 lg:col-6 border
                        <%} else{ %>
                          d-hidden row-fluid col-12 col-6 lg:col-6 border
                        <% } %>           
                        
                        " style="vertical-align: top;">
                        <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                            <ContentTemplate>
                                <div style="max-height: 650px; overflow-y: auto;">
                                    <div class="pl-sm f-size-2xs f-color-secondary border-default border-y sr-header p-xs text-center">
                                        Outdoor Camera List
                                    </div>
                                    <asp:GridView ID="grdOutdoor" CssClass="stacked table-zebra w-full text-center capitalize border-t border-default" runat="server" AutoGenerateColumns="false"
                                        OnRowCommand="grdOutdoor_RowCommand" AlternatingRowStyle-CssClass="bg-light" Width="100%">
                                        <%--   <PagerSettings Position="TopAndBottom" />
                                    <PagerStyle VerticalAlign="Bottom" />--%>
                                        <EmptyDataTemplate>
                                            <div align="center">
                                                <h4>
                                                    <label class="text-center text-danger f-size-2xs">
                                                        No Data Found</label>
                                                </h4>
                                            </div>
                                        </EmptyDataTemplate>
                                        <Columns>
                                            <asp:TemplateField HeaderText="" ItemStyle-CssClass="pl-thin text-left f-size-xxs" HeaderStyle-CssClass="pl-sm f-size-1xs f-color-secondary border-default border-b sr-header text-left" ItemStyle-Width="3%" HeaderStyle-Width="3%">
                                                <ItemTemplate>
                                                    <a id="a_<%#Container.DataItemIndex %>" class='btn btn-primary btnwidth2 cursor-pointer' data-toggle="modal" data-target="#myModal" title='<%# Eval("District") %>'
                                                        onclick="loadac('<%#exam.Common.Encode("010$"+ Eval("District").ToString()) %>',<%#Container.DataItemIndex %>,this,'outside','<%=grdOutdoor.ClientID %>')">
                                                        <span class="icon mr-xs flex-none f-color-primary">
                                                            <span class="">
                                                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-down">
                                                                    <polyline points="6 9 12 15 18 9"></polyline></svg></span>
                                                        </span>
                                                    </a>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="DISTRICT" HeaderStyle-Font-Size="8" ItemStyle-CssClass="p-thin text-left f-size-xxs pl-sm" HeaderStyle-CssClass="pl-sm f-size-1xs f-color-secondary border-default border-b sr-header text-left">
                                                <ItemTemplate><%# Eval("District") %></ItemTemplate>
                                            </asp:TemplateField>
                                            <%--<asp:TemplateField HeaderText="<%$appSettings:assemblyname%>" ItemStyle-CssClass="p-thin" HeaderStyle-CssClass="f-size-xxs f-color-secondary border-default border-b sr-header p-xs">
                                    <ItemTemplate><%# Eval("Acname") %></ItemTemplate>
                                </asp:TemplateField>--%>
                                            <%--<asp:TemplateField HeaderText="TOTAL BOOTH" ItemStyle-CssClass="p-thin text-center f-size-xxs" HeaderStyle-CssClass="f-size-1xs f-color-secondary border-default border-b sr-header p-xs text-center">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkTotalBooth" Text='<%# Eval("TotalBooth") %>' runat="server" CssClass="no-underline" ForeColor="Green" Visible='<%# Eval("TotalBooth").ToString() != "0" %>' CommandName="TotalBooth" CommandArgument='<%# Eval("District") %>' />
                                                    <asp:Label ID="lblTotalBooth" Text='<%# Eval("TotalBooth") %>' runat="server" ForeColor="Green" Visible='<%# Eval("TotalBooth").ToString() == "0" %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>--%>
                                            <asp:TemplateField HeaderText="TOTAL" HeaderStyle-Font-Size="8" ItemStyle-CssClass="p-thin text-center f-size-xxs" HeaderStyle-CssClass="f-size-1xs f-color-secondary border-default border-b sr-header text-center">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkTotal" Text='<%# Eval("Total") %>' runat="server" CssClass="no-underline" ForeColor="Green" Visible='<%# Eval("Total").ToString() != "0" %>' CommandName="Total" CommandArgument='<%# Eval("District") %>' />
                                                    <asp:Label ID="lblTotal" Text='<%# Eval("Total") %>' runat="server" ForeColor="Green" Visible='<%# Eval("Total").ToString() == "0" %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="ONLINE" HeaderStyle-Font-Size="8" ItemStyle-CssClass="p-thin text-center f-size-xxs" HeaderStyle-CssClass="f-size-1xs f-color-secondary border-default border-b sr-header text-center">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkOnline" Text='<%# Eval("online") %>' runat="server" CssClass="no-underline" ForeColor="Green" Visible='<%# Eval("online").ToString() != "0" %>' CommandName="Online" CommandArgument='<%# Eval("District") %>' />
                                                    <asp:Label ID="lblOnline" Text='<%# Eval("online") %>' runat="server" ForeColor="Green" Visible='<%# Eval("online").ToString() == "0" %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="OFFLINE" HeaderStyle-Font-Size="8" ItemStyle-CssClass="p-thin text-center f-size-xxs" HeaderStyle-CssClass="f-size-1xs f-color-secondary border-default border-b sr-header text-center">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkOffline" Text='<%# Eval("offline") %>' runat="server" ForeColor="Red" CssClass="no-underline" Visible='<%# Eval("offline").ToString() != "0" %>' CommandName="Offline" CommandArgument='<%# Eval("District") %>' />
                                                    <asp:Label ID="lblOffline" Text='<%# Eval("offline") %>' runat="server" ForeColor="Red" Visible='<%# Eval("offline").ToString() == "0" %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </ContentTemplate>
                            <Triggers>
                                <%--<asp:AsyncPostBackTrigger ControlID="btnShowData" EventName="Click" />--%>
                                <%--<asp:AsyncPostBackTrigger ControlID="btnCancel" EventName="Click" />--%>
                                <%--<asp:AsyncPostBackTrigger ControlID="grdOutdoor" EventName="RowCommand" />--%>
                                <%--<asp:AsyncPostBackTrigger ControlID="ddlReasons" EventName="SelectedIndexChanged" />--%>
                                <asp:AsyncPostBackTrigger ControlID="grdDashboard" EventName="RowCommand" />
                    <asp:AsyncPostBackTrigger ControlID="grdIndoor" EventName="RowCommand" />
                    <asp:AsyncPostBackTrigger ControlID="grdOutdoor" EventName="RowCommand" />
                    <asp:AsyncPostBackTrigger ControlID="grdPink" EventName="RowCommand" />
                    <asp:AsyncPostBackTrigger ControlID="grdAro" EventName="RowCommand" />
                    <asp:AsyncPostBackTrigger ControlID="grdState" EventName="RowCommand" />
                            </Triggers>
                        </asp:UpdatePanel>
                    </div>
                </div>
              
            </div>

            <div class="<% if (ConfigurationManager.AppSettings["barchartdisable"].ToString() == "1")
                { %> d-hidden row-fluid col-6 col-6 lg:col-6 border <%}
                else
                { %> row-fluid <% } %> " style="vertical-align: top;">
                <%
                    var distList = string.Empty;
                    var chart2num = string.Empty;
                    var chart3num = string.Empty;
                    var chart4num = string.Empty;
                    var chart5num = string.Empty;

                    for(int i = 0; i < BarGraph.Tables[0].Rows.Count; i++)
                    {
                        var row = BarGraph.Tables[0].Rows[i];
                        //if(i % 2 == 0)
                        //{
                        chart2num += "'" + row["online"].ToString() + "',";
                        chart2num += "'',";
                        chart3num += "'" + row["offline"].ToString() + "',";
                        chart3num += "'',";
                        distList += "'" + row[0].ToString() + "','',";
                        //}
                        //else
                        //{
                        //    chart4num += "'',";
                        //    chart4num += "'" + row["online"].ToString() + "',";
                        //    chart5num += "'',";
                        //    chart5num += "'" + row["offline"].ToString() + "',";
                        //}
                    }
                %>
                   
                <div class="col-12 flex-row flex-wrap mx-auto px-xs mt-sm">
                 

                    <script>
                        const barCtx = document.getElementById('BarChart').getContext('2d');

                        const barLabels = [<%= distList.Length > 0 ? distList.Remove(distList.Length - 1) : "" %> ];
                        const barData = {
                            labels: barLabels,
                            datasets: [
                                {
                                    label: 'Online Camera',
                                    data: [<%= chart2num.Length > 0 ? chart2num.Remove(chart2num.Length - 1) : "" %>],
                                    backgroundColor: "Green",
                                    barThickness: 7
                                },
                                {
                                    label: 'Offline Camera',
                                    data: [<%= chart3num.Length > 0 ? chart3num.Remove(chart3num.Length - 1) : ""%>],
                                    backgroundColor: "Red",
                                    barThickness: 7
                                }
                                <%--,
                                {
                                    label: 'Online Outdoor',
                                    data: [<%= chart4num.Length > 0 ? chart4num.Remove(chart4num.Length - 1) : ""%>],
                                    backgroundColor: "Yellow",
                                    barThickness: 7
                                },
                                {
                                    label: 'Offline Outdoor',
                                    data: [<%= chart5num.Length > 0 ? chart5num.Remove(chart5num.Length - 1) : ""%>],
                                    backgroundColor: "Blue",
                                    barThickness: 7
                                }--%>
                            ]
                        };
                        const barChart = new Chart(barCtx, {
                            type: 'bar',
                            data: barData,
                            options: {
                                plugins: {
                                    title: {
                                        display: true,
                                        text: 'State Wise Bar Chart Of Chandigarh For Device Online Offline tracking'
                                    },
                                },
                                responsive: true,
                                scales: {
                                    xAxes: [{
                                        stacked: true,
                                    }],
                                    yAxes: [{
                                        stacked: true
                                    }]
                                }
                            }
                        });
                    </script>
                </div>
            </div>
        </div>

        <div class="d-hidden  col-12 flex-row flex-wrap mx-auto px-xs mt-sm">
             <div class="d-hidden row-fluid col-12 col-6 lg:col-6 border" style="vertical-align: top;">
                        <asp:UpdatePanel ID="UpdatePanel7" runat="server">
                            <ContentTemplate>
                                <div class="pl-sm f-size-2xs f-color-secondary border-default border-y sr-header p-xs text-center">
                                    Women(Pink) Booth Camera List
                                </div>
                                <div class="col-12 flex-row flex-wrap mx-auto px-xs mt-sm">
                            <div class="row-fluid col-12 col-12 lg:col-12 border" style="vertical-align: top;">
                                <div>
                                    <asp:GridView ID="grdPinkTot" CssClass="stacked table-zebra w-full text-center capitalize border-t border-default" runat="server" AutoGenerateColumns="false"
                                        AlternatingRowStyle-CssClass="bg-light" Width="100%">
                                        <%--   <PagerSettings Position="TopAndBottom" />
                                    <PagerStyle VerticalAlign="Bottom" />--%>
                                        <EmptyDataTemplate>
                                            <div align="center">
                                                <h4>
                                                    <label class="text-center text-danger f-size-2xs">
                                                        No Data Found</label>
                                                </h4>
                                            </div>
                                        </EmptyDataTemplate>
                                        <Columns>
                                            <asp:TemplateField HeaderText="" ItemStyle-CssClass="pl-thin text-left f-size-2xs" HeaderStyle-CssClass="pl-sm f-size-2xs f-color-secondary border-default border-b sr-header p-xs text-left" ItemStyle-Width="3%" HeaderStyle-Width="3%">
                                                <ItemTemplate>
                                                    <a id="a_<%#Container.DataItemIndex %>" class='btn btn-primary btnwidth2 cursor-pointer <%#Container.DataItemIndex == 0 ? "d-hidden" : "" %>' data-toggle="modal" data-target="#myModal" title='<%# Eval("District") %>'
                                                        onclick="loadac('<%#exam.Common.Encode("010$"+ Eval("District").ToString()) %>',<%#Container.DataItemIndex %>,this,'','<%=grdDashboard.ClientID %>')">
                                                        <span class="icon mr-xs flex-none f-color-primary">
                                                            <span class="">
                                                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-down">
                                                                    <polyline points="6 9 12 15 18 9"></polyline></svg></span>
                                                        </span>
                                                    </a>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="State" HeaderStyle-Width="35%" ItemStyle-CssClass="p-thin text-left f-size-2sm f-weight-semibold pl-sm" HeaderStyle-CssClass="pl-sm f-size-2xs f-color-secondary border-default border-b sr-header p-xs text-left">
                                                <ItemTemplate><%# Eval("District") %></ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="TOTAL" HeaderStyle-Width="20%" ItemStyle-CssClass="p-thin text-center f-size-2sm f-weight-semibold" HeaderStyle-CssClass="f-size-2xs f-color-secondary border-default border-b sr-header p-xs text-center">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkTotal" Text='<%# Eval("Total") %>' runat="server" CssClass="no-underline" ForeColor="Green" Visible='<%# Eval("Total").ToString() != "0" %>' CommandName="Total" CommandArgument='<%# Eval("District") %>' />
                                                    <asp:Label ID="lblTotal" Text='<%# Eval("Total") %>' runat="server" ForeColor="Green" Visible='<%# Eval("Total").ToString() == "0" %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="ONLINE" HeaderStyle-Width="20%" ItemStyle-CssClass="p-thin text-center f-size-2sm f-weight-semibold" HeaderStyle-CssClass="f-size-2xs f-color-secondary border-default border-b sr-header p-xs text-center">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkOnline" Text='<%# Eval("online") %>' runat="server" CssClass="no-underline" ForeColor="Green" Visible='<%# Eval("online").ToString() != "0" %>' CommandName="Online" CommandArgument='<%# Eval("District") %>' />
                                                    <asp:Label ID="lblOnline" Text='<%# Eval("online") %>' runat="server" ForeColor="Green" Visible='<%# Eval("online").ToString() == "0" %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="OFFLINE" HeaderStyle-Width="20%" ItemStyle-CssClass="p-thin text-center f-size-2sm f-weight-semibold" HeaderStyle-CssClass="f-size-2xs f-color-secondary border-default border-b sr-header p-xs text-center">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkOffline" Text='<%# Eval("offline") %>' runat="server" ForeColor="Red" CssClass="no-underline" Visible='<%# Eval("offline").ToString() != "0" %>' CommandName="Offline" CommandArgument='<%# Eval("District") %>' />
                                                    <asp:Label ID="lblOffline" Text='<%# Eval("offline") %>' runat="server" ForeColor="Red" Visible='<%# Eval("offline").ToString() == "0" %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </div>
                        </div>
                                <div style="max-height: 550px; overflow-y: auto;">
                                    <asp:GridView ID="grdPink" CssClass="stacked table-zebra w-full text-center capitalize border-t border-default" runat="server" AutoGenerateColumns="false"
                                        OnRowCommand="grdPink_RowCommand" AlternatingRowStyle-CssClass="bg-light" Width="100%">
                                        <%--   <PagerSettings Position="TopAndBottom" />
                                    <PagerStyle VerticalAlign="Bottom" />--%>
                                        <EmptyDataTemplate>
                                            <div align="center">
                                                <h4>
                                                    <label class="text-center text-danger f-size-2xs">
                                                        No Data Found</label>
                                                </h4>
                                            </div>
                                        </EmptyDataTemplate>
                                        <Columns>
                                            <asp:TemplateField HeaderText="" ItemStyle-CssClass="pl-thin text-left f-size-xxs" HeaderStyle-CssClass="pl-sm f-size-1xs f-color-secondary border-default border-b sr-header p-xs text-left" ItemStyle-Width="3%" HeaderStyle-Width="3%">
                                                <ItemTemplate>
                                                    <a id="a_<%#Container.DataItemIndex %>" class='btn btn-primary btnwidth2 cursor-pointer' data-toggle="modal" data-target="#myModal" title='<%# Eval("District") %>'
                                                        onclick="loadac('<%#exam.Common.Encode("010$"+ Eval("District").ToString()) %>',<%#Container.DataItemIndex %>,this,'pink','<%=grdPink.ClientID %>')">
                                                        <span class="icon mr-xs flex-none f-color-primary">
                                                            <span class="">
                                                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-down">
                                                                    <polyline points="6 9 12 15 18 9"></polyline></svg></span>
                                                        </span>
                                                    </a>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="DISTRICT" ItemStyle-CssClass="p-thin text-left f-size-xxs pl-sm" HeaderStyle-CssClass="pl-sm f-size-1xs f-color-secondary border-default border-b sr-header p-xs text-left">
                                                <ItemTemplate><%# Eval("District") %></ItemTemplate>
                                            </asp:TemplateField>
                                            <%--<asp:TemplateField HeaderText="<%$appSettings:assemblyname%>" ItemStyle-CssClass="p-thin" HeaderStyle-CssClass="f-size-xxs f-color-secondary border-default border-b sr-header p-xs">
                                    <ItemTemplate><%# Eval("Acname") %></ItemTemplate>
                                </asp:TemplateField>--%>
                                            <%--<asp:TemplateField HeaderText="TOTAL BOOTH" ItemStyle-CssClass="p-thin text-center f-size-xxs" HeaderStyle-CssClass="f-size-1xs f-color-secondary border-default border-b sr-header p-xs text-center">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkTotalBooth" Text='<%# Eval("TotalBooth") %>' runat="server" CssClass="no-underline" ForeColor="Green" Visible='<%# Eval("TotalBooth").ToString() != "0" %>' CommandName="TotalBooth" CommandArgument='<%# Eval("District") %>' />
                                                    <asp:Label ID="lblTotalBooth" Text='<%# Eval("TotalBooth") %>' runat="server" ForeColor="Green" Visible='<%# Eval("TotalBooth").ToString() == "0" %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>--%>
                                            <asp:TemplateField HeaderText="TOTAL" ItemStyle-CssClass="p-thin text-center f-size-xxs" HeaderStyle-CssClass="f-size-1xs f-color-secondary border-default border-b sr-header p-xs text-center">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkTotal" Text='<%# Eval("Total") %>' runat="server" CssClass="no-underline" ForeColor="Green" Visible='<%# Eval("Total").ToString() != "0" %>' CommandName="Total" CommandArgument='<%# Eval("District") %>' />
                                                    <asp:Label ID="lblTotal" Text='<%# Eval("Total") %>' runat="server" ForeColor="Green" Visible='<%# Eval("Total").ToString() == "0" %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="ONLINE" ItemStyle-CssClass="p-thin text-center f-size-xxs" HeaderStyle-CssClass="pl-sm f-size-1xs f-color-secondary border-default border-b sr-header p-xs text-center">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkOnline" Text='<%# Eval("online") %>' runat="server" CssClass="no-underline" ForeColor="Green" Visible='<%# Eval("online").ToString() != "0" %>' CommandName="Online" CommandArgument='<%# Eval("District") %>' />
                                                    <asp:Label ID="lblOnline" Text='<%# Eval("online") %>' runat="server" ForeColor="Green" Visible='<%# Eval("online").ToString() == "0" %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="OFFLINE" ItemStyle-CssClass="p-thin text-center f-size-xxs" HeaderStyle-CssClass="pl-sm f-size-1xs f-color-secondary border-default border-b sr-header p-xs text-center">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkOffline" Text='<%# Eval("offline") %>' runat="server" ForeColor="Red" CssClass="no-underline" Visible='<%# Eval("offline").ToString() != "0" %>' CommandName="Offline" CommandArgument='<%# Eval("District") %>' />
                                                    <asp:Label ID="lblOffline" Text='<%# Eval("offline") %>' runat="server" ForeColor="Red" Visible='<%# Eval("offline").ToString() == "0" %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </ContentTemplate>
                            <Triggers>
                                <%--<asp:AsyncPostBackTrigger ControlID="btnShowData" EventName="Click" />--%>
                                <%--<asp:AsyncPostBackTrigger ControlID="btnCancel" EventName="Click" />--%>
                                <asp:AsyncPostBackTrigger ControlID="grdDashboard" EventName="RowCommand" />
                                <%--<asp:AsyncPostBackTrigger ControlID="ddlReasons" EventName="SelectedIndexChanged" />--%>
                            </Triggers>
                        </asp:UpdatePanel>
                    </div>



            <div class="d-hidden <% if (  ConfigurationManager.AppSettings["pichartdisable"].ToString() == "1") { %> d-hidden row-fluid col-12 col-6 lg:col-6 border <%} else { %> row-fluid col-12 col-6 lg:col-6 border <%} %> " style="vertical-align: top;">
                <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                    <ContentTemplate>
                        <div class="col-12 flex-row flex-wrap mx-auto px-xs mt-sm">
                            <div class="row-fluid col-12 col-6 lg:col-6" style="vertical-align: top;">
                                <canvas id="onlineOffline" class="f-size-xl m-auto" width="350" height="350"></canvas>
                                <script>
                                    new Chart("onlineOffline", {
                                        type: "pie",
                                        data: {
                                            labels: ["online", "Offline"],
                                            datasets: [{
                                                backgroundColor: ["green", "red"],
                                                data: [<%= Convert.ToInt32(GUJRATTotal.Rows[0]["online"]) %>, <%= Convert.ToInt32(GUJRATTotal.Rows[0]["offline"]) %>]
                                            }]
                                        },
                                        options: {
                                            responsive: true,
                                            scaleFontColor: "#FFFFFF",
                                            title: {
                                                display: true,
                                                text: "Total Camera Contribution <%=ConfigurationManager.AppSettings["statename"].ToString()%>"
                                            }, legend: {
                                                display: false
                                            },
                                            pieceLabel: {
                                                mode: 'value',
                                                precision: 0,
                                                fontColor: '#fff',
                                                fontStyle: 'bold',
                                            }
                                        },

                                    });
                                </script>
                            </div>
                            <%
                                var distList = string.Empty;
                                var distTotle = string.Empty;
                                var distOnline = string.Empty;
                                var distOffline = string.Empty;

                                foreach (System.Data.DataRow row in Graph.Tables[0].Rows)

                                {

                                    var PbTotal = GUJRATTotal.Rows[0]["Total"].ToString().Equals("0") ? 1 : float.Parse(GUJRATTotal.Rows[0]["Total"].ToString(), System.Globalization.CultureInfo.InvariantCulture.NumberFormat);
                                    var PbOnline = GUJRATTotal.Rows[0]["online"].ToString().Equals("0") ? 1 : float.Parse(GUJRATTotal.Rows[0]["online"].ToString(), System.Globalization.CultureInfo.InvariantCulture.NumberFormat);
                                    var PbOffline = GUJRATTotal.Rows[0]["offline"].ToString().Equals("0") ? 1 : float.Parse(GUJRATTotal.Rows[0]["offline"].ToString(), System.Globalization.CultureInfo.InvariantCulture.NumberFormat);
                                    var chart1per = String.Format("{0:0.00}",Convert.ToInt32(row["Total"]) / PbTotal * 100);
                                    var chart2per = String.Format("{0:0.00}",Convert.ToInt32(row["online"]) / PbOnline * 100);
                                    var chart3per = String.Format("{0:0.00}",Convert.ToInt32(row["offline"]) / PbOffline * 100);

                                    distList += "'" + row[0].ToString() + "',";
                                    distTotle += "'" + chart1per.ToString() + "',";
                                    distOnline += "'" + chart2per.ToString() + "',";
                                    distOffline += "'" + chart3per.ToString() + "',";

                                }
                            %>
                            <div class="row-fluid col-12 col-6 lg:col-6" style="vertical-align: top;">
                                <canvas id="totalContribution" class="f-size-xl m-auto" width="310" height="310"></canvas>
                                <script>
                                    new Chart("totalContribution", {
                                        type: "pie",
                                        data: {
                                            labels: [<%= distList.Length > 0 ? distList.Remove(distList.Length - 1) : "" %>],
                                            datasets: [{
                                                backgroundColor:[<%= "'" + string.Join("','",Colors) + "'"%>],
                                                data: [<%= distTotle %>],
      //                                          datalabels: {
                                                  //  color: '#FFCE56'
                                                  //}

                                            }]
                                        },
                                        options: {
                                            responsive: false,
                                            scaleFontColor: "#FFFFFF",
                                            plugins: {
                                                    color: '#fff',
                                            },
                                            tooltips: {
                                                enabled: true
                                               },
                                            title: {
                                                display: true,
                                                text: "District wise Camera Contribution"
                                            }, legend: {
                                                display: false
                                            },
                                            pieceLabel: {
                                                mode: 'value',
                                                precision: 0,
                                                fontColor: '#000',
                                                fontStyle: 'bold',
                                                position: 'outside'
                                            }
 
                                        }
                                    });
                                </script>
                            </div>
                            
                        </div>
                        <div class="col-12 flex-row flex-wrap mx-auto px-xs mt-sm">
                            <div class="row-fluid col-12 col-6 lg:col-6" style="vertical-align: top;">
                                <canvas id="onlineContribution" class="f-size-xl m-auto" width="310" height="310"></canvas>
                                <script>
                                    new Chart("onlineContribution", {
                                        type: "pie",
                                        data: {
                                            labels: [<%= distList.Length > 0 ? distList.Remove(distList.Length - 1) : "" %>],
                                            datasets: [{
                                                backgroundColor: [<%= "'" + string.Join("','",Colors) + "'"%>],
                                                data: [<%= distOnline %>]
                                            }]
                                        },
                                        options: {
                                            responsive: false,
                                            scaleFontColor: "#FFFFFF",
                                            title: {
                                                display: true,
                                                text: "District wise Online Camera Contribution "
                                            }, legend: {
                                                display: false
                                            },
                                            pieceLabel: {
                                                mode: 'value',
                                                precision: 0,
                                                fontColor: '#000',
                                                fontStyle: 'bold',
                                                position: 'outside'
                                            }
                                        },

                                    });
                                </script>
                            </div>
                            <div class="row-fluid col-12 col-6 lg:col-6" style="vertical-align: top;">
                                <canvas id="offlineContribution" class="f-size-xl m-auto" width="310" height="310"></canvas>
                                <script>
                                    new Chart("offlineContribution", {
                                        type: "pie",
                                        data: {
                                            labels: [<%= distList.Length > 0 ? distList.Remove(distList.Length - 1) : "" %>],
                                            datasets: [{
                                                backgroundColor: [<%= "'" + string.Join("','",Colors) + "'"%>],
                                                data: [<%= distOffline %>]
                                            }]
                                        },
                                        options: {
                                            responsive: false,
                                            scaleFontColor: "#FFFFFF",
                                            title: {
                                                display: true,
                                                text: "District wise Offline Camera Contribution"
                                            }, legend: {
                                                display: false
                                            },
                                            pieceLabel: {
                                                mode: 'value',
                                                precision: 0,
                                                fontColor: '#000',
                                                fontStyle: 'bold',
                                                position: 'outside'
                                            }
                                        },

                                    });
                                </script>
                            </div>
                        </div>

                        <%--<div class="col-12 flex-row flex-wrap mx-auto px-xs mt-sm">
                            <div class="row-fluid col-12 col-4 lg:col-4 pl-sm f-size-2xs f-color-secondary border-default border-y sr-header p-xs text-center">
                                CAMERA CONTRIBUTION
                            </div>
                            <div class="row-fluid col-12 col-4 lg:col-4 pl-sm f-size-2xs f-color-secondary border-default border-y sr-header p-xs text-center">
                                ONLINE CAMERA CONTRIBUTION
                            </div>
                            <div class="row-fluid col-12 col-4 lg:col-4 pl-sm f-size-2xs f-color-secondary border-default border-y sr-header p-xs text-center">
                                OFFLINE CAMERA CONTRIBUTION
                            </div>
                        </div>--%>

                        <%--<div style="max-height: 550px; overflow-y: auto;">--%>
                        <%--<% foreach (System.Data.DataRow row in Graph.Tables[0].Rows)
                                {%>
                            <%
                                var PbTotal = GUJRATTotal.Rows[0]["Total"].ToString().Equals("0") ? 1 : float.Parse(GUJRATTotal.Rows[0]["Total"].ToString(), System.Globalization.CultureInfo.InvariantCulture.NumberFormat);
                                var PbOnline = GUJRATTotal.Rows[0]["online"].ToString().Equals("0") ? 1 : float.Parse(GUJRATTotal.Rows[0]["online"].ToString(), System.Globalization.CultureInfo.InvariantCulture.NumberFormat);
                                var PbOffline = GUJRATTotal.Rows[0]["offline"].ToString().Equals("0") ? 1 : float.Parse(GUJRATTotal.Rows[0]["offline"].ToString(), System.Globalization.CultureInfo.InvariantCulture.NumberFormat);
                                var chart1per = Convert.ToInt32(row["Total"]) / PbTotal * 100;
                                var chart2per = Convert.ToInt32(row["online"]) / PbOnline * 100;
                                var chart3per = Convert.ToInt32(row["offline"]) / PbOffline * 100;
                            %>--%>
                        <%--<div class="col-12 flex-row flex-wrap mx-auto px-xs mt-sm">
                                <div class="row-fluid col-12 col-4 lg:col-4" style="vertical-align: top;">
                                    <canvas id="<%= row["district"].tostring() + "_1"%>" class="f-size-xl m-auto" width="250" height="200"></canvas>
                                </div>
                                <script>
                                    new chart("<%= row["district"].tostring() + "_1"%>", {
                                        type: "pie",
                                        data: {
                                            labels: ["<%= row["district"].tostring()%>"],
                                            datasets: [{
                                                backgroundcolor: ["#188389", "#d53343"],
                                                data: [<%= chart1per %>, <%= 100 - chart1per %>]
                                            }]
                                        },
                                        options: {
                                            responsive: false,
                                            scalefontcolor: "#ffffff",
                                            title: {
                                                display: true,
                                                text: ""
                                            }, legend: {
                                                display: true
                                            }
                                        },

                                    });
                                </script>
                                <div class="row-fluid col-12 col-4 lg:col-4" style="vertical-align: top;">
                                    <canvas id="<%= row["district"].tostring() + "_2"%>" class="f-size-xl m-auto" width="250" height="200"></canvas>
                                </div>
                                <script>
                                    new chart("<%= row["district"].tostring() + "_2"%>", {
                                        type: "pie",
                                        data: {
                                            labels: ["<%= row["district"].tostring()%>"],
                                            datasets: [{
                                                backgroundcolor: ["#00ff00", "#d53343"],
                                                data: [<%= chart2per %>, <%= 100 - chart2per %>]
                                            }]
                                        },
                                        options: {
                                            responsive: false,
                                            scalefontcolor: "#ffffff",
                                            title: {
                                                display: true,
                                                text: ""
                                            }, legend: {
                                                display: true
                                            }
                                        },

                                    });
                                </script>
                                <div class="row-fluid col-12 col-4 lg:col-4" style="vertical-align: top;">
                                    <canvas id="<%= row["district"].tostring() + "_3"%>" class="f-size-xl m-auto" width="250" height="200"></canvas>
                                </div>
                                <script>
                                    new chart("<%= row["district"].tostring() + "_3"%>", {
                                        type: "pie",
                                        data: {
                                            labels: ["<%= row["district"].tostring()%>"],
                                            datasets: [{
                                                backgroundcolor: ["#d53343", "#188389"],
                                                data: [<%= chart3per %>, <%= 100 - chart3per %>]
                                            }]
                                        },
                                        options: {
                                            responsive: false,
                                            scalefontcolor: "#ffffff",
                                            title: {
                                                display: true,
                                                text: ""
                                            }, legend: {
                                                display: true
                                            }
                                        },

                                    });
                                </script>
                            </div>--%>
                        <%-- <%} %>
                        </div>--%>
                    </ContentTemplate>
                    <Triggers>
                        <%--<asp:AsyncPostBackTrigger ControlID="btnShowData" EventName="Click" />--%>
                        <%--<asp:AsyncPostBackTrigger ControlID="btnCancel" EventName="Click" />--%>
                        <asp:AsyncPostBackTrigger ControlID="grdDashboard" EventName="RowCommand" />
                        <%--<asp:AsyncPostBackTrigger ControlID="ddlReasons" EventName="SelectedIndexChanged" />--%>
                    </Triggers>
                </asp:UpdatePanel>

            </div>
        </div>
            <div class="d-hidden row-fluid col-12 col-6 lg:col-6 border" style="vertical-align: top;">

                <asp:UpdatePanel ID="UpdatePanel6" runat="server">
                    <ContentTemplate>
                        <div class="d-hidden pl-sm f-size-2xs f-color-secondary border-default border-y sr-header p-xs text-center">
                            Assembly Camera List
                        </div>
                        <div class="col-12 flex-row flex-wrap mx-auto px-xs mt-sm">
                            <div class="row-fluid col-12 col-12 lg:col-12 border" style="vertical-align: top;">
                                <div>
                                    <asp:GridView ID="grdAroTot" CssClass="stacked table-zebra w-full text-center capitalize border-t border-default" runat="server" AutoGenerateColumns="false"
                                        AlternatingRowStyle-CssClass="bg-light" Width="100%">
                                        <%--   <PagerSettings Position="TopAndBottom" />
                                    <PagerStyle VerticalAlign="Bottom" />--%>
                                        <EmptyDataTemplate>
                                            <div align="center">
                                                <h4>
                                                    <label class="text-center text-danger f-size-2xs">
                                                        No Data Found</label>
                                                </h4>
                                            </div>
                                        </EmptyDataTemplate>
                                        <Columns>
                                            <asp:TemplateField HeaderText="" ItemStyle-CssClass="pl-thin text-left f-size-2xs" HeaderStyle-CssClass="pl-sm f-size-2xs f-color-secondary border-default border-b sr-header p-xs text-left" ItemStyle-Width="3%" HeaderStyle-Width="3%">
                                                <ItemTemplate>
                                                    <a id="a_<%#Container.DataItemIndex %>" class='btn btn-primary btnwidth2 cursor-pointer <%#Container.DataItemIndex == 0 ? "d-hidden" : "" %>' data-toggle="modal" data-target="#myModal" title='<%# Eval("District") %>'
                                                        onclick="loadac('<%#exam.Common.Encode("010$"+ Eval("District").ToString()) %>',<%#Container.DataItemIndex %>,this,'','<%=grdDashboard.ClientID %>')">
                                                        <span class="icon mr-xs flex-none f-color-primary">
                                                            <span class="">
                                                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-down">
                                                                    <polyline points="6 9 12 15 18 9"></polyline></svg></span>
                                                        </span>
                                                    </a>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="State" HeaderStyle-Width="35%" ItemStyle-CssClass="p-thin text-left f-size-2sm f-weight-semibold pl-sm" HeaderStyle-CssClass="pl-sm f-size-2xs f-color-secondary border-default border-b sr-header p-xs text-left">
                                                <ItemTemplate><%# Eval("District") %></ItemTemplate>
                                            </asp:TemplateField>
                                            <%--<asp:TemplateField HeaderText="<%$appSettings:assemblyname%>" ItemStyle-CssClass="p-thin" HeaderStyle-CssClass="f-size-xxs f-color-secondary border-default border-b sr-header p-xs">
                                    <ItemTemplate><%# Eval("Acname") %></ItemTemplate>
                                </asp:TemplateField>--%>
                                            <%--<asp:TemplateField HeaderText="TOTAL BOOTH" ItemStyle-CssClass="p-thin text-center f-size-xxs" HeaderStyle-CssClass="f-size-2xs f-color-secondary border-default border-b sr-header p-xs text-center">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lnkTotalBooth" Text='<%# Eval("TotalBooth") %>' runat="server" CssClass="no-underline" ForeColor="Green" Visible='<%# Eval("TotalBooth").ToString() != "0" %>' CommandName="TotalBooth" CommandArgument='<%# Eval("District") %>' />
                                            <asp:Label ID="lblTotalBooth" Text='<%# Eval("TotalBooth") %>' runat="server" ForeColor="Green" Visible='<%# Eval("TotalBooth").ToString() == "0" %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>--%>
                                            <asp:TemplateField HeaderText="TOTAL" HeaderStyle-Width="20%" ItemStyle-CssClass="p-thin text-center f-size-2sm f-weight-semibold" HeaderStyle-CssClass="f-size-2xs f-color-secondary border-default border-b sr-header p-xs text-center">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkTotal" Text='<%# Eval("Total") %>' runat="server" CssClass="no-underline" ForeColor="Green" Visible='<%# Eval("Total").ToString() != "0" %>' CommandName="Total" CommandArgument='<%# Eval("District") %>' />
                                                    <asp:Label ID="lblTotal" Text='<%# Eval("Total") %>' runat="server" ForeColor="Green" Visible='<%# Eval("Total").ToString() == "0" %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="ONLINE" HeaderStyle-Width="20%" ItemStyle-CssClass="p-thin text-center f-size-2sm f-weight-semibold" HeaderStyle-CssClass="f-size-2xs f-color-secondary border-default border-b sr-header p-xs text-center">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkOnline" Text='<%# Eval("online") %>' runat="server" CssClass="no-underline" ForeColor="Green" Visible='<%# Eval("online").ToString() != "0" %>' CommandName="Online" CommandArgument='<%# Eval("District") %>' />
                                                    <asp:Label ID="lblOnline" Text='<%# Eval("online") %>' runat="server" ForeColor="Green" Visible='<%# Eval("online").ToString() == "0" %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="OFFLINE" HeaderStyle-Width="20%" ItemStyle-CssClass="p-thin text-center f-size-2sm f-weight-semibold" HeaderStyle-CssClass="f-size-2xs f-color-secondary border-default border-b sr-header p-xs text-center">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkOffline" Text='<%# Eval("offline") %>' runat="server" ForeColor="Red" CssClass="no-underline" Visible='<%# Eval("offline").ToString() != "0" %>' CommandName="Offline" CommandArgument='<%# Eval("District") %>' />
                                                    <asp:Label ID="lblOffline" Text='<%# Eval("offline") %>' runat="server" ForeColor="Red" Visible='<%# Eval("offline").ToString() == "0" %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </div>
                        </div>
                        <div style="max-height: 550px; overflow-y: auto;">
                            <asp:GridView ID="grdAro" CssClass="stacked table-zebra w-full text-center capitalize" runat="server" AutoGenerateColumns="false"
                                AlternatingRowStyle-CssClass="bg-light" Width="100%">
                                <%--   <PagerSettings Position="TopAndBottom" />
                                    <PagerStyle VerticalAlign="Bottom" />--%>
                                <EmptyDataTemplate>
                                    <div align="center">
                                        <h4>
                                            <label class="text-center text-danger f-size-2xs">
                                                No Data Found</label>
                                        </h4>
                                    </div>
                                </EmptyDataTemplate>
                                <Columns>
                                    <%--<asp:TemplateField HeaderText="" ItemStyle-CssClass="pl-thin text-left f-size-xxs" HeaderStyle-CssClass="pl-sm f-size-2xs f-color-secondary border-default border-b sr-header p-xs text-left" ItemStyle-Width="3%" HeaderStyle-Width="3%">
                                        <ItemTemplate>
                                            <a id="a_<%#Container.DataItemIndex %>" class='btn btn-primary btnwidth2 cursor-pointer' data-toggle="modal" data-target="#myModal" title='<%# Eval("District") %>'
                                                onclick="loadac('<%#exam.Common.Encode("010$"+ Eval("District").ToString()) %>',<%#Container.DataItemIndex %>,this,'','<%=grdDashboard.ClientID %>')">
                                                <span class="icon mr-xs flex-none f-color-primary">
                                                    <span class=""><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-down"><polyline points="6 9 12 15 18 9"></polyline></svg></span>
                                                </span>
                                            </a>
                                        </ItemTemplate>
                                    </asp:TemplateField>--%>
                                    <asp:TemplateField HeaderText="ASSEMBLY" ItemStyle-CssClass="p-thin text-left f-size-xxs pl-2lg" HeaderStyle-CssClass="pl-2lg f-size-2xs f-color-secondary border-default border-b sr-header p-xs text-left">
                                        <ItemTemplate><%# Eval("acname") %></ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="STATUS" ItemStyle-CssClass="p-thin text-left f-size-xxs" HeaderStyle-CssClass="f-size-2xs f-color-secondary border-default border-b sr-header p-xs text-left" Visible="True">
                                        <ItemTemplate>
                                            <asp:Label ID="lblTotal" Text='<%# Eval("status") %>' runat="server" Style='<%# Eval("status").ToString() == "ONLINE" ? "color:green": "color:red" %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField ItemStyle-CssClass="p-thin text-center f-size-xxs" HeaderStyle-CssClass="f-size-2xs f-color-secondary border-default border-b sr-header p-xs text-left">
                                        <ItemTemplate>
                                            <a href="javascript:void(0)" id="lnkplay" runat="server"></a>
                                            <div align="center" style="vertical-align: top; display: inline">
                                                <a href="#" data-backdrop="static" title="View" data-title=" <%#Eval("acname") %>" data-content=" <%#Eval("location") %>"
                                                    style="color: #1499d6" onclick="watchvideopopup('<%# Eval("streamname") %>','<%# Eval("servername") %>','<%#exam.Common.Encode(Eval("statusFlag").ToString())%>','<%#exam.Common.Encode(Eval("bkpstreamid") == DBNull.Value ? "0" : Eval("bkpstreamid").ToString())%>');return false">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-eye">
                                                        <path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"></path><circle cx="12" cy="12" r="3"></circle>
                                                    </svg>
                                                </a>
                                                <%--<a href="http://<%# Eval("servername") %>.vmukti.com:8080/recordings/<%# Eval("streamname") %>.flv"
                                                            style="color: #1499d6">--%>
                                            </div>
                                            <div style="display: none;" id="ifc<%# Eval("streamname") %>">
                                            </div>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <%--<asp:TemplateField HeaderText="ONLINE" HeaderStyle-Width="20%" ItemStyle-CssClass="p-thin text-center f-size-xxs" HeaderStyle-CssClass="f-size-2xs f-color-secondary border-default border-b sr-header p-xs text-center">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lnkOnline" Text='<%# Eval("online") %>' runat="server" CssClass="no-underline" ForeColor="Green" Visible='<%# Eval("online").ToString() != "0" %>' CommandName="Online" CommandArgument='<%# Eval("District") %>' />
                                            <asp:Label ID="lblOnline" Text='<%# Eval("online") %>' runat="server" ForeColor="Green" Visible='<%# Eval("online").ToString() == "0" %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="OFFLINE" HeaderStyle-Width="20%" ItemStyle-CssClass="p-thin text-center f-size-xxs" HeaderStyle-CssClass="f-size-2xs f-color-secondary border-default border-b sr-header p-xs text-center">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lnkOffline" Text='<%# Eval("offline") %>' runat="server" ForeColor="Red" CssClass="no-underline" Visible='<%# Eval("offline").ToString() != "0" %>' CommandName="Offline" CommandArgument='<%# Eval("District") %>' />
                                            <asp:Label ID="lblOffline" Text='<%# Eval("offline") %>' runat="server" ForeColor="Red" Visible='<%# Eval("offline").ToString() == "0" %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>--%>
                                </Columns>
                            </asp:GridView>
                        </div>

                    </ContentTemplate>
                    <Triggers>
                        <%--<asp:AsyncPostBackTrigger ControlID="btnShowData" EventName="Click" />--%>
                        <%--<asp:AsyncPostBackTrigger ControlID="btnCancel" EventName="Click" />--%>
                        <asp:AsyncPostBackTrigger ControlID="grdDashboard" EventName="RowCommand" />
                        <%--<asp:AsyncPostBackTrigger ControlID="ddlReasons" EventName="SelectedIndexChanged" />--%>
                    </Triggers>
                </asp:UpdatePanel>
            </div>
        </div>
        

        <div id="divDashboardDetails" runat="server" class="row-fluid d-inline-block" style="width: 100%!important;">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:GridView ID="grdDashboardDetails" CssClass="stacked table-zebra w-full text-center capitalize border-t border-default" runat="server" AutoGenerateColumns="false"
                        AlternatingRowStyle-CssClass="bg-light" Width="100%">
                        <%--   <PagerSettings Position="TopAndBottom" />
                                    <PagerStyle VerticalAlign="Bottom" />--%>
                        <EmptyDataTemplate>
                            <div align="center">
                                <h4>
                                    <label class="text-center text-danger">
                                        No Data Found</label>
                                </h4>
                            </div>
                        </EmptyDataTemplate>
                        <Columns>
                            <%--<asp:TemplateField HeaderText="<%$appSettings:district%>" ItemStyle-CssClass="p-thin f-size-xxs f-color-derfault text-left" HeaderStyle-CssClass="f-size-xxs f-color-secondary border-default border-b sr-header p-xs text-left">
                                <ItemTemplate><%# Eval("District") %></ItemTemplate>
                            </asp:TemplateField>--%>
                            <asp:TemplateField HeaderText="Sr. No." ItemStyle-CssClass="p-thin f-size-xxs f-color-derfault text-left" HeaderStyle-CssClass="f-size-xxs f-color-secondary border-default border-b sr-header p-xs text-left">
                                <ItemTemplate><%# (Container.DataItemIndex + 1) %></ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="District" HeaderStyle-Width="20%" ItemStyle-CssClass="p-thin f-size-xxs f-color-derfault text-left" HeaderStyle-CssClass="f-size-xxs f-color-secondary border-default border-b sr-header p-xs text-left">
                                <ItemTemplate><%# Eval("district") %></ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="<%$appSettings:assemblyname%>" HeaderStyle-Width="20%" ItemStyle-CssClass="p-thin f-size-xxs f-color-derfault text-left" HeaderStyle-CssClass="f-size-xxs f-color-secondary border-default border-b sr-header p-xs text-left">
                                <ItemTemplate><%# Eval("Acname") %></ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Location" HeaderStyle-Width="30%" ItemStyle-CssClass="p-thin f-size-xxs f-color-derfault text-left" HeaderStyle-CssClass="f-size-xxs f-color-secondary border-default border-b sr-header p-xs text-left">
                                <ItemTemplate><%# Eval("PSNum").ToString() + " - " + Eval("location").ToString() %></ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Camera ID" HeaderStyle-Width="20%" ItemStyle-CssClass="p-thin f-size-xxs f-color-derfault text-left" HeaderStyle-CssClass="f-size-xxs f-color-secondary border-default border-b sr-header p-xs text-left">
                                <ItemTemplate><%# Eval("streamname") %></ItemTemplate>
                            </asp:TemplateField>
                            <%--<asp:TemplateField HeaderText="Status" ItemStyle-CssClass="p-thin f-size-xxs f-color-derfault text-left" HeaderStyle-CssClass="f-size-xxs f-color-secondary border-default border-b sr-header p-xs text-left">
                                <ItemTemplate><%# Eval("Status").ToString() == "RUNNING" ? "Online" : Eval("Status").ToString() == "STOPPED" ? "Offline" : Eval("Status").ToString() %></ItemTemplate>
                            </asp:TemplateField>--%>
                            <asp:TemplateField HeaderText="Operator Name" HeaderStyle-Width="15%" ItemStyle-CssClass="p-thin f-size-xxs f-color-derfault text-left" HeaderStyle-CssClass="f-size-xxs f-color-secondary border-default border-b sr-header p-xs text-left">
                                <ItemTemplate><%# Eval("drivername") %></ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Contact No" HeaderStyle-Width="15%" ItemStyle-CssClass="p-thin f-size-xxs f-color-derfault text-left" HeaderStyle-CssClass="f-size-xxs f-color-secondary border-default border-b sr-header p-xs text-left">
                                <ItemTemplate><%# Eval("drivercontactno") %></ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="grdDashboard" EventName="RowCommand" />
                    <asp:AsyncPostBackTrigger ControlID="grdIndoor" EventName="RowCommand" />
                    <asp:AsyncPostBackTrigger ControlID="grdOutdoor" EventName="RowCommand" />
                    <asp:AsyncPostBackTrigger ControlID="grdPink" EventName="RowCommand" />
                    <asp:AsyncPostBackTrigger ControlID="grdAro" EventName="RowCommand" />
                    <asp:AsyncPostBackTrigger ControlID="grdState" EventName="RowCommand" />
                    <%--<asp:AsyncPostBackTrigger ControlID="btnCancel" EventName="Click" />--%>
                    <%--<asp:AsyncPostBackTrigger ControlID="grdDashboard" EventName="RowCommand" />--%>
                    <%--<asp:AsyncPostBackTrigger ControlID="ddlReasons" EventName="SelectedIndexChanged" />--%>
                </Triggers>
            </asp:UpdatePanel>
        </div>
        <%if (Page.User.Identity.IsAuthenticated && Session["userType"] != null)
            { %>
        <div id="myModal" class="modal">

            <!-- Modal content -->
            <div class="modal-content">

                <div class="card" style="background: #FFFFFF">
                    <div style="height: 20px; padding-right: 10px">
                        <span aria-hidden="true" class="close">&times;</span>
                    </div>
                    <br />
                    <div class="embed-responsive embed-responsive-16by9 mr-thin" style="border-radius: 0px; margin: 0">
                        <iframe id="iframevideo" class="embed-responsive-item" frameborder="0" scrolling="no"></iframe>
                    </div>
                </div>
            </div>

        </div>
        <div id="myModal1" data-backdrop="static" class="modal fade" role="dialog">
            <div class="modal-dialog">
                <div class="container">
                    <div class="row">
                        <div class="col-md-6">
                            <div id="diviframe" class="embed-responsive pb100">
                                <iframe id="iframesetting" class="embed-responsive-item" frameborder="0" scrolling="no"></iframe>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%} %>
    </section>
    <script src="js/carousel.js"></script>
    <%--<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD2CF3PlGBd0tQhusHwX3ngfPaad0pmJ_Q&callback=MapInit"></script>--%>
    <script type="text/javascript">
        var $j = jQuery.noConflict();
        $j(document).ready(function () {
            // Activate Carousel
            $j("#myCarousel").carousel();

            // Enable Carousel Indicators
            $j(".item1").click(function () {
                $j("#myCarousel").carousel(0);
            });
            $j(".item2").click(function () {
                $j("#myCarousel").carousel(1);
            });
            $j(".item3").click(function () {
                $j("#myCarousel").carousel(2);
            });
            $j(".item4").click(function () {
                $j("#myCarousel").carousel(3);
            });
            $j(".item5").click(function () {
                $j("#myCarousel").carousel(4);
            });
            //$j(".item6").click(function () {
            //    $j("#myCarousel").carousel(5);
            //});
            //$j(".item7").click(function () {
            //    $j("#myCarousel").carousel(6);
            //});
            // Enable Carousel Controls
            $j(".left").click(function () {
                $j("#myCarousel").carousel("prev");
            });
            $j(".right").click(function () {
                $j("#myCarousel").carousel("next");
            });
        });
        function loadac(pcname, i, obj, type, grdid) {
            var nexttr = $j("<tr id='trac_" + type + "_" + i + "'><td colspan='6'></td></tr>");
            var currenttr = $j(obj).closest("tr");
            var nexttrexists = currenttr.next("#trac_" + type + "_" + i).length > 0 ? true : false;
            if (nexttrexists) {
                $j("#trac_" + type + "_" + i).remove();
                $j(obj).find('polyline').attr('points', '6 9 12 15 18 9');
            }
            else {
                $j.get('assemblydashboard.aspx?pcname=' + pcname + '&type=' + type, function (data) {
                    //hide all open trac_
                    $j('#' + grdid).find('polyline').attr('points', '6 9 12 15 18 9');
                    //show only current trac_
                    //$j(nexttr).show('slide');
                    $j(nexttr).find("td").empty();
                    $j(nexttr).find("td").html(data);
                    $j(obj).find('polyline').attr('points', '18 15 12 9 6 15');
                    $j(nexttr).insertAfter(currenttr)
                });
            }
            //if ($j("#trac_" + i).is(':visible')) {
            //    $j("#trac_" + i).hide('slide');
            //    $j("#trac_" + i + " td").empty();
            //    $j(obj).find('polyline').attr('points', '6 9 12 15 18 9');
            //}
            //else {

            //}
        }
    </script>
    <script>
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(function () {
            <%
                                distList = string.Empty;
                                var distTotle = string.Empty;
                                var distOnline = string.Empty;
                                var distOffline = string.Empty;

                                foreach (System.Data.DataRow row in Graph.Tables[0].Rows)

                                {

                                    var PbTotal = GUJRATTotal.Rows[0]["Total"].ToString().Equals("0") ? 1 : float.Parse(GUJRATTotal.Rows[0]["Total"].ToString(), System.Globalization.CultureInfo.InvariantCulture.NumberFormat);
                                    var PbOnline = GUJRATTotal.Rows[0]["online"].ToString().Equals("0") ? 1 : float.Parse(GUJRATTotal.Rows[0]["online"].ToString(), System.Globalization.CultureInfo.InvariantCulture.NumberFormat);
                                    var PbOffline = GUJRATTotal.Rows[0]["offline"].ToString().Equals("0") ? 1 : float.Parse(GUJRATTotal.Rows[0]["offline"].ToString(), System.Globalization.CultureInfo.InvariantCulture.NumberFormat);
                                    var chart1per = String.Format("{0:0.00}",Convert.ToInt32(row["Total"]) / PbTotal * 100);
                                    var chart2per = String.Format("{0:0.00}",Convert.ToInt32(row["online"]) / PbOnline * 100);
                                    var chart3per = String.Format("{0:0.00}",Convert.ToInt32(row["offline"]) / PbOffline * 100);

                                    distList += "'" + row[0].ToString() + "',";
                                    distTotle += "'" + chart1per.ToString() + "',";
                                    distOnline += "'" + chart2per.ToString() + "',";
                                    distOffline += "'" + chart3per.ToString() + "',";

                                }
                            %>
            new Chart("offlineContribution", {
                                        type: "pie",
                                        data: {
                                            labels: [<%= distList.Length > 0 ? distList.Remove(distList.Length - 1) : "" %>],
                                            datasets: [{
                                                backgroundColor: [<%= "'" + string.Join("','",Colors) + "'"%>],
                                                data: [<%= distOffline %>]
                                            }]
                                        },
                                        options: {
                                            responsive: false,
                                            scaleFontColor: "#FFFFFF",
                                            title: {
                                                display: true,
                                                text: "District wise Offline Camera Contribution"
                                            }, legend: {
                                                display: false
                                            },
                                            pieceLabel: {
                                                mode: 'value',
                                                precision: 0,
                                                fontColor: '#000',
                                                fontStyle: 'bold',
                                                position: 'outside'
                                            }
                                        },

            });

            new Chart("onlineContribution", {
                                        type: "pie",
                                        data: {
                                            labels: [<%= distList.Length > 0 ? distList.Remove(distList.Length - 1) : "" %>],
                                            datasets: [{
                                                backgroundColor: [<%= "'" + string.Join("','",Colors) + "'"%>],
                                                data: [<%= distOnline %>]
                                            }]
                                        },
                                        options: {
                                            responsive: false,
                                            scaleFontColor: "#FFFFFF",
                                            title: {
                                                display: true,
                                                text: "District wise Online Camera Contribution "
                                            }, legend: {
                                                display: false
                                            },
                                            pieceLabel: {
                                                mode: 'value',
                                                precision: 0,
                                                fontColor: '#000',
                                                fontStyle: 'bold',
                                                position: 'outside'
                                            }
                                        },

            });
            new Chart("totalContribution", {
                                        type: "pie",
                                        data: {
                                            labels: [<%= distList.Length > 0 ? distList.Remove(distList.Length - 1) : "" %>],
                                            datasets: [{
                                                backgroundColor:[<%= "'" + string.Join("','",Colors) + "'"%>],
                                                data: [<%= distTotle %>],
      //                                          datalabels: {
                                                  //  color: '#FFCE56'
                                                  //}

                                            }]
                                        },
                                        options: {
                                            responsive: false,
                                            scaleFontColor: "#FFFFFF",
                                            plugins: {
                                                    color: '#fff',
                                            },
                                            tooltips: {
                                                enabled: true
                                               },
                                            title: {
                                                display: true,
                                                text: "District wise Camera Contribution"
                                            }, legend: {
                                                display: false
                                            },
                                            pieceLabel: {
                                                mode: 'value',
                                                precision: 0,
                                                fontColor: '#000',
                                                fontStyle: 'bold',
                                                position: 'outside'
                                            }
 
                                        }
            });

            new Chart("onlineOffline", {
                                        type: "pie",
                                        data: {
                                            labels: ["online", "Offline"],
                                            datasets: [{
                                                backgroundColor: ["green", "red"],
                                                data: [<%= Convert.ToInt32(GUJRATTotal.Rows[0]["online"]) %>, <%= Convert.ToInt32(GUJRATTotal.Rows[0]["offline"]) %>]
                                            }]
                                        },
                                        options: {
                                            responsive: true,
                                            scaleFontColor: "#FFFFFF",
                                            title: {
                                                display: true,
                                                text: "Total Camera Contribution <%=ConfigurationManager.AppSettings["statename"].ToString()%>"
                    }, legend: {
                        display: false
                    },
                    pieceLabel: {
                        mode: 'value',
                        precision: 0,
                        fontColor: '#fff',
                        fontStyle: 'bold',
                    }
                },

            });
        })

        setInterval(function () {
            window.location.reload();
        }, 300000)
    </script>
</asp:Content>
