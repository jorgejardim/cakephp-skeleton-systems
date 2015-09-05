var tour = {
    id: "tour-hopscotch",
    steps: [
        {
            title: "Título",
            content: "Texto de ajuda. Texto de ajuda.",
            target: "first-tips",
            placement: "top",
            width: "210px"
        },
        {
            title: "Título",
            content: "Texto de ajuda. Texto de ajuda. Texto de ajuda. Texto de ajuda.",
            target: "two-tips",
            placement: "right",
            width: "210px"
        },
        {
            title: "Título",
            content: "Texto de ajuda. Texto de ajuda. Texto de ajuda. Texto de ajuda.",
            target: "three-tips",
            placement: "right",
            width: "210px"
        },
        {
            title: "Título",
            content: "Texto de ajuda. Texto de ajuda. Texto de ajuda. Texto de ajuda.",
            target: "item_1",
            placement: "right",
            width: "210px"
        },
        {
            title: "Título",
            content: "Texto de ajuda. Texto de ajuda.",
            target: "item_disabled_1",
            placement: "right",
            width: "210px"
        }
    ],
    i18n: {
        nextBtn: "Próximo",
        prevBtn: "Anterior",
        doneBtn: "Ok",
        skipBtn: "Pular",
        closeTooltip: "Fechar",
    },
    bubblePadding: 10
};

hopscotch.startTour(tour);