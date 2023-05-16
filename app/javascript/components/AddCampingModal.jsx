import { Button, Form, Input, Modal, Select } from "antd";
import React from "react";

const { Option } = Select;

class AddCampingModal extends React.Component {

constructor(props){
  super(props);
  this.formRef = React.createRef();
  this.state = {
    visible: false,
  };
}
  onFinish (values) {
    const url = "api/v1/campings/";
    fetch(url, {
      method: "post",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify(values),
    })
      .then((data) => {
        if (data.ok) {
          this.handleCancel();

          return data.json();
        }
        throw new Error("Network error.");
      })
      .then(() => {
        this.props.reloadCampings();
      })
      .catch((err) => console.error("Error: " + err));
  };

  showModal () {
    this.setState({
      visible: true,
    });
  };

  handleCancel ()  {
    this.setState({
      visible: false,
    });
  };

  render() {
    return (
      <React.Fragement>
        <Button type="primary" onClick={this.showModal}>
          Create New +
        </Button>

        <Modal title="Add New Camping ..." visible={this.state.visible} onCancel={this.handleCancel} footer={null}>
          <Form ref={this.formRef} layout="vertical" onFinish={this.onFinish}>
            <Form.Item name="name" label="Name" rules={[{ required: true, message: "Please input your camping name!" }]}>
              <Input placeholder="Input your camping name" />
            </Form.Item>

            <Form.Item name="body" label="Body" rules={[{ required: true, message: "Please input your camping body!" }]}>
              <Input placeholder="Input your camping body" />
            </Form.Item>

            <Form.Item
              name="country"
              label="Country"
              rules={[
                {
                  required: true,
                  message: "Please input the country of the camping!",
                },
              ]}
            >
              <Select showSearch placeholder="Select your beer country" optionFilterProp="children" style={{ width: "100%" }}>
                <Option value="Russia">Russia</Option>
                <Option value="USA">USA</Option>
              </Select>
            </Form.Item>

            <Form.Item name="region" label="Region" rules={[{ required: true, message: "Please input the region!" }]}>
              <Input type="string" placeholder="Input name of the region" />
            </Form.Item>
            <Form.Item name="city" label="City" rules={[{ required: true, message: "Please input the city!" }]}>
              <Input type="string" placeholder="Input name of the city" />
            </Form.Item>

            <Form.Item>
              <Button type="primary" htmlType="submit">
                Submit
              </Button>
            </Form.Item>
          </Form>
        </Modal>
      </React.Fragement>
    );
  }
}

export default AddCampingModal;