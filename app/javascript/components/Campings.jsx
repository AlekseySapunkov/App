import { Table, message, Popconfirm } from "antd";
import React from "react";
import AddCampingModal from "./AddCampingModal";

class Campings extends React.Component {
  constructor(props){
    super(props)
this.columns = [
    {
      title: "Name",
      dataIndex: "name",
      key: "name",
    },
    {
      title: "Body",
      dataIndex: "body",
      key: "body",
    },
    {
      title: "Country",
      dataIndex: "country",
      key: "country",
    },
    {
      title: "Region",
      dataIndex: "region",
      key: "region",
    },
    {
        title: "City",
        dataIndex: "city",
        key: "city",
      },
    {
      title: "",
      key: "action",
      render: (_text, record) => (
        <Popconfirm title="Are you sure to delete this camping?" onConfirm={() => this.deleteCamping(record.id)} okText="Yes" cancelText="No">
          <a href="#" type="danger">
            Delete{" "}
          </a>
        </Popconfirm>
      ),
    },
  ];

  this.state = {
    campings: [],
  };
  }
  

  componentDidMount() {
    this.loadCampings();
  }

  loadCampings () {
    const url = "//index";
    fetch(url)
      .then((data) => {
        if (data.ok) {
          return data.json();
        }
        throw new Error("Network error.");
      })
      .then((data) => {
        data.forEach((camping) => {
          const newEl = {
            key: camping.id,
            id: camping.id,
            name: camping.name,
            body: camping.body,
            country: camping.country,
            region: camping.region,
            city: camping.city,
          };

          this.setState((prevState) => ({
            campings: [...prevState.campings, newEl],
          }));
        });
      })
      .catch((err) => message.error("Error: " + err));
  };

  reloadCampings () {
    this.setState({ campings: [] });
    this.loadCampings();
  };

  deleteCampings (id)  {
    const url = `api/v1/campings/${id}`;

    fetch(url, {
      method: "delete",
    })
      .then((data) => {
        if (data.ok) {
          this.reloadCampings();
          return data.json();
        }
        throw new Error("Network error.");
      })
      .catch((err) => message.error("Error: " + err));
  };

  render() {
    return (
      <React.Fragment>
        <Table className="table-striped-rows" dataSource={this.state.campings} columns={this.columns} pagination={{ pageSize: 5 }} />

        <AddCampingModal reloadCampings={this.reloadCampings} />
      </React.Fragment>
    );
  }
}

export default Campings;