state = {
    campings: [],
  };
  loadCampigss = () => {
    const url = "controllers/v1/beers/index";
    fetch(url)
      .then((data) => {
        if (data.ok) {
          return data.json();
        }
        throw new Error("Network error.");
      })
      .then((data) => {
        data.forEach((beer) => {
          const newEl = {
            key: beer.id,
            id: beer.id,
            brand: beer.brand,
            style: beer.style,
            country: beer.country,
            quantity: beer.quantity,
          };
  
          this.setState((prevState) => ({
            beers: [...prevState.beers, newEl],
          }));
        });
      })
      .catch((err) => message.error("Error: " + err));
  };